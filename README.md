# Schema

This directory contains the canonical schema definitions for Petroglyph Star Wars game XML data files. The schema drives editor intelligence (completions, hover documentation, and diagnostics) in the LSP server.

## Structure

```
schema/
  .schemas/*.json     JSON Schemas the files below are validated against (see Validation)
  eaw/                Empire at War schema (complete)
    _index.json       Manifest consumed by HttpSchemaProvider; carries baselineHash
    types.yaml        Object type registry (125 types)
    tags/*.yaml       125 tag files - one per KeyMapTable from DatabaseMapExport.xml
    enums/*.yaml      49 enum definition files
    hardcoded/*.yaml  3 hardcoded token lists (AbilityClass, AbilityType, BehaviorModule)
    meta/
      metafiles.yaml  Metafile type mappings (file registries, singletons, etc.)
  foc/                Forces of Corruption schema (work in progress - extends eaw)
    _index.json
    types.yaml
  lua/                Lua stub files (---@meta) the server and any LuaCATS-aware analyzer read
    _files.json       The stub files, in load order; a server older than this manifest reads api.d.lua alone
    api.d.lua         GENERATED - the engine's Lua API: 133 registered globals, 9 wrapper classes, 212 methods
    stdlib.d.lua      The standard library the engine opens (Lua 5.0 shape: base, string, table, security)
    globals.d.lua     The globals each script host maps in (Object, PlayerObject, Target, Budget, ...)
  tools/lua/
    api.measured.d.lua  The engine surface as measured from the game's own bindings - never edited here
    overlay.json        Prose, parameter names, ---@aetref reference tags and enum-typed parameters
    generate.js         Merges the two into lua/api.d.lua and adds ---@alias unions from the enum files
```

The Lua API file is generated: `node tools/lua/generate.js` after editing `overlay.json`. The
measured file is a hand-off from the engine measurement and is replaced whole when re-measured.
The custom tag `---@aetref <ReferenceKind>[:<referenceType>]` after a `---@param` says what the
string names (an XML object of a type, a localisation key, a bone, an enum value); the older
`---@xmlref XmlObject[:Type]` spelling is read the same way.

## Coverage

| Game | Tags | Enums | Hardcoded | Meta | Status |
|---|---|---|---|---|--|
| Empire at War (`eaw`) | 125 | 49 | 3 | 1 | Work in progress |
| Forces of Corruption (`foc`) | - | - | - | - | Work in progress |

FoC inherits all EaW definitions at runtime. The `foc/` directory will carry only overrides and additions that differ from the base game.

## Validation

Every YAML file here is validated against a JSON Schema in [`.schemas/`](.schemas) by the
`validate-schema` workflow, on push and on every pull request. The schemas are deliberately stricter
than the consuming loader, which is lenient enough that mistakes here are silent - a YAML syntax
error takes out the *entire* game schema, an unknown `type:` makes the loader skip that tag, and a
misspelled key is ignored outright. Install
[redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) to get
the same checks while editing; `.vscode/settings.json` already maps them.

See [CONTRIBUTING.md](CONTRIBUTING.md#validation) for the file-to-schema mapping and what to do when
the C# side gains a new value.

## `_index.json` manifest

Consumed by `HttpSchemaProvider` when loading schema from a remote URL. Contains:

- `types`, `kinds`, `tags`, `enums`, `hardcoded`, `meta` - ordered lists of relative paths for each category.
- `baselineHash` - SHA-256 of every listed YAML file's raw bytes in manifest order (Tags -> Types -> Kinds -> Enums -> Hardcoded -> Meta). Used for a single-hash cache-validity check instead of re-reading every file.

The `baselineHash` field is kept up to date automatically by the repository's git pre-commit hook - you do not need to update it by hand. When you add or remove a YAML file you must update the corresponding list in `_index.json` manually before committing.

## `types.yaml`

One entry per game object type:

| Field | Required | Description |
|---|---|---|
| `typeName` | Yes | Matches the `KeyMapTable.Name` from `DatabaseMapExport.xml` |
| `nameTag` | No | XML attribute that identifies instances (almost always `Name`) |
| `description.en` | No | English prose description |

115 of 124 types have `nameTag: Name`. The 9 singleton types (`GameConstants`, `AudioConstants`, `TacticalCameraConstants`, `RadarMap`, `DifficultyAdjustment`, `Draw3DTextCrawl`, `WeatherAudioManager`, `GraphicDetailSetting`, `GraphicDetailHardwareProfile`) have no `nameTag`.

## Tag files (`tags/*.yaml`)

Each file corresponds to one `KeyMapTable` and lists every XML parameter the engine recognises. The file stem must match the `typeName` exactly.

```yaml
tags:
  - tag: My_Tag
    type: NameReference
    referenceKind: xmlObject        # omit when the value names nothing
    referenceType: SFXEvent         # the target type or kind, for xmlObject and workspaceFile
    enumName: MyEnum                # required when referenceKind is enum
    multipleAllowed: true           # omit unless the tag may repeat on one object
    notes:                          # optional, see below
      - kind: Since
        value: "1.05"
    description:
      en: "English description."
```

### `notes`

Everything worth saying about a tag beyond its description. Replaces the `deprecated`, `untested` and `availableSince` fields of schema 1.x, which the schema now rejects.

| Kind | Meaning |
|---|---|
| `BuggedInEngine` | Accepted by the parser, but does nothing or the wrong thing; shown as an error |
| `Deprecated` | Worked once; something replaced it |
| `Untested` | Believed correct, never verified against the shipped data |
| `Remark` | A caveat with nothing to act on |
| `Since` | The version the tag appeared in, carried in `value` |

Every kind but `Since` carries its prose in `text.en`.

### `type` values

Every value the `type` field accepts. The parser matches them ignoring case. A type says how the value is shaped; what it names comes from `referenceKind`, `enumName` or `slots`.

**Scalars**

| Type | Description |
|---|---|
| `Boolean` | `Yes` / `No` |
| `Int` | Signed integer |
| `UInt` | Unsigned integer |
| `Float` | Floating-point number, parsed leniently (`1`, `1.0`, `1.0f`) |
| `NormalizedFloat` | Float in [0, 1] |
| `RGBA` | `R G B A` colour, components 0-255 |
| `DynamicEnumValue` | One value of the enum named by `enumName` |
| `EnumValueList` | Comma-separated values of the enum named by `enumName` |
| `ShipClassType` | Ship class enum value |
| `ProjectileCategory` | Projectile category enum value |
| `ProjectileCategoryList` | Comma-separated projectile categories |
| `CableRenderMode` | Cable-attack render mode |
| `CombatModType` | Combat modifier a projectile applies (`Projectile_Combat_Mod`) |
| `PositionLabel` | Named position (`In_Base`, `Out_Base`, `Orbital`) |
| `UvSlotIndex` | UV channel index, 0-3 |

**Vectors and lists**

| Type | Description |
|---|---|
| `FloatVector2` | Two floats |
| `FloatVector3` | Three floats |
| `FloatVector4` | Four floats |
| `FloatVector3List` | Space-separated `FloatVector3` values |
| `IntList` | Space- or comma-separated integers |
| `FloatList` | Space- or comma-separated floats |
| `FloatTupleList` | Comma-separated float pairs; the engine requires at least two |
| `IntFloatTupleList` | Comma-separated `int, float` pairs; the engine requires at least two |

**References**

| Type | Description |
|---|---|
| `NameReference` | One name - an object, a file or a text key; `referenceKind` says which |
| `NameReferenceList` | Space-separated names; `referenceKind` says what they name |
| `TypeReference` | One object, from a pool the engine looks up directly |
| `TypeReferenceList` | Space-separated `TypeReference` values |
| `GameObjectTypeReferenceList` | Space-separated game object names |
| `FactionReference` | One faction name |
| `SFXEventReference` | One SFX event |
| `SpeechEventReference` | One speech event |
| `MusicEventReference` | One music event |
| `SfxEventHudReference` | One SFX event, played as HUD feedback |
| `ShipNameTextFileList` | Ship-name text files |

**Pairs, maps and groups**

| Type | Description |
|---|---|
| `TupleList` | Comma-separated items in repeating groups; `slots` says what each item of a group is |
| `ListMap` | Comma-separated keys, each followed by the items it maps to; `slots` names the key and the item |
| `ConditionalSfxEvent` | Unit type, then the SFX event that replaces the default for it |
| `ConditionalSpeechEvent` | Unit type conditions joined by Or/And, then a speech event |
| `HardPointSfxMap` | `HardPointType, SFXEvent` pairs; the event may be empty |
| `AbilitySfxMap` | `ability, SFXEvent` pairs; the event may be empty |
| `AbilityModMultiplier` | `AbilityMultiplierType, float` pairs |
| `AbilityModFlag` | `AbilityFlagType, bool` pair |
| `UnitSpawnTable` | `UnitType, count` pairs; -1 is the default stack size |
| `UnitSpawnProbabilityTable` | `UnitType, probability` pairs |
| `DeathCloneSpec` | `condition, UnitType` pair |
| `InaccuracyMap` | `category, distance` pairs |
| `CategoryToFloatMap` | `category, float` pairs |
| `CategoryToIntegerMap` | `category, int` pairs |
| `HardPointTypeToTextureMap` | Texture per hardpoint type (the target reticles) |
| `LocalisationToTextureMap` | Texture per language (the localised splash screens) |
| `DamageToArmorMod` | Damage modifier per damage and armor type (`Damage_To_Armor_Mod`) |
| `MusicEventPerFactionMap` | `Faction, MusicEvent` pairs |
| `PerFactionValue` | `Faction, value` pairs |
| `PerFactionPlanet` | `Faction, Planet` pair |
| `PerFactionIntMap` | `Faction, int` pairs |
| `ForceDeploymentList` | `Faction, Planet, UnitType` groups |
| `MovieFrameTrigger` | Frame number, then an event name |
| `CommandBarProperty` | Command bar property name, then its value |

**Child-element containers**

| Type | Description |
|---|---|
| `AbilityDefinitionSubObjectList` | Child elements, each an ability named by its element |
| `GuiActivatedAbilityDefinitionSubObjectList` | `Unit_Ability` child elements |
| `ActionDefinitionSubObjectList` | Action definition child elements (`HeroClashType`) |

**Hardware and audio**

| Type | Description |
|---|---|
| `HardwareUInt` | Hardware capability figure (CPU MHz, texture memory MB, fill rate) |
| `ShaderVersionHex` | Shader version in hex (`0x0200` = shader model 2.0) |
| `VendorIdHex` | GPU vendor id in hex (`0x10DE`) |
| `AudioParamInt` | Small audio integer: priority, pitch, pan |
| `SfxPercentage` | Integer percentage 0-100, for volume and probability |
| `SfxCount` | Play count or concurrent instances; -1 is unlimited |
| `Audio3dProviderName` | Quoted 3D audio provider name |

**Not yet named**

`Type26`, `Type35`, `Type36`, `Type37` and `Type38` are engine type codes a few tags use - a hardware device id list, and the weather SFX tags - whose shape is not documented yet. `Type11`, `Type24`, `Type25`, `Type44`, `Type46`, `Type49`, `Type51` and `AbilityType` are accepted but no shipped tag uses them.

### `slots`

`TupleList` and `ListMap` say nothing about their items; the tag's `slots` do. Each slot is typed the way a whole tag is - `referenceKind` with `referenceType` or `enumName` - or left untyped, which reads the item as text and checks nothing.

```yaml
  - tag: Land_Terrain_Model_Mapping
    type: TupleList
    slots:
      - label: Environment          # what the reader calls the item
        referenceKind: enum
        enumName: MapEnvironment
      - label: Model
        referenceKind: modelFile
```

- `TupleList`: the slots repeat in order for the whole value - `Temperate, A.ALO, Arctic, B.ALO`
- `ListMap`: exactly two slots, the key and the item. An item is a key when it IS one, wherever it sits - `Empire, A, B, Rebel, C` is two keys with their objects. The schema rejects a `ListMap` without both slots

### `referenceKind` values

What a value names. Allowed on any tag and on any slot; omitted, the value names nothing and is checked only for its shape. The parser matches these ignoring case.

| Value | Meaning |
|---|---|
| `xmlObject` | A named XML object. `referenceType` is the target type (`Faction`, `SFXEvent`) or an object kind from `kinds.yaml` (`Planet`, `Squadron`), which accepts any object of that kind |
| `enum` | A value of the enum named by `enumName` |
| `hardcodedSet` | A value of a hardcoded set from `hardcoded/` |
| `localisationKey` | A localisation key (`TEXT_...`) |
| `modelFile` | An `.alo` model file |
| `textureFile` | A `.tga` or `.dds` texture; either satisfies a name with the other extension |
| `audioFile` | An audio sample file (`.wav`, `.mp3`) |
| `mapFile` | A tactical map file (`.ted`) |
| `boneName` | A bone of the object's model |
| `workspaceFile` | A file of the mod; `referenceType` names the file type (`StoryPlotManifest`) |
| `unknown` | A name whose target cannot be classified, such as some story event parameters; not checked |
| `none` | The same as omitting the field |

## Enum files (`enums/*.yaml`)

Two kinds of enum exist.

### Schema-fixed enums (C++ enums)

`kind` is omitted or `schemaFixed`. Values are hardcoded in the engine and stable across all installations. The YAML `values` list is authoritative.

```yaml
name: MyEnum
description:
  en: "English description."
values:
  - name: VALUE_ONE
    description:
      en: "What this value means."
    notes:
      en: "Additional usage notes or caveats."
```

### Dynamic XML enums

`kind: dynamicXml`. Values are defined in game XML files under `data/xml/enum/`. The YAML carries **no** `values` block; values are loaded at runtime from `sourceFile`. Mods may extend these enums.

```yaml
name: GameObjectCategoryType
kind: dynamicXml
isBitfield: true          # present only for bitfield enums; values combine with |
sourceFile: data/xml/enum/gameobjectcategorytype.xml
description:
  en: "English description."
```

Two dynamic enums are bitfields where values combine with `|`: `GameObjectCategoryType` and `GameObjectPropertiesType`.

### StoryEventType - enum with typed parameters

`StoryEventType` is a special schema-fixed enum whose values carry positional parameter definitions. These drive story-scripting validation and hover docs.

```yaml
values:
  - name: STORY_ACCUMULATE
    description:
      en: "..."
    params:
      - position: 0
        type: Int
        description:
          en: "Credit threshold."
      - position: 1
        type: DynamicEnumValue
        enumName: StoryFlagCompareMethod
        optional: true
        description:
          en: "Comparison operator. Defaults to GREATER_THAN."
```

Parameter fields: `position` (0-based), `type` (any tag `type` value), `referenceType`, `enumName`, `optional` (default `false`), `description.en`.

## Hardcoded files (`hardcoded/*.yaml`)

The `hardcoded/` directory holds enum-like token lists that the engine recognises as comma-separated flags inside specific XML tags. Currently contains one file:

**`BehaviorModule.yaml`** - behaviour-module flags used by the `Behavior`, `GalacticBehavior`, `LandBehavior`, `SpaceBehavior`, and `DeployedBehavior` tags.

Format is identical to a schema-fixed enum, with `name`, optional `description.en`, and optional `notes.en` per value.

## Metafile definitions (`meta/metafiles.yaml`)

Maps well-known XML registry files to the object types they contain. Used by the workspace scanner to infer file types without parsing every file.

```yaml
metafiles:
  - path: data/xml/gameobjectfiles.xml
    metaFileType: fileRegistry
    types:
      - GameObjectType
    description:
      en: "..."
```

### `metaFileType` values

| Value | Meaning |
|---|---|
| `fileRegistry` | Lists XML files; every file it registers is of the given type |
| `directContent` | Contains the actual game objects directly (not a file list) |
| `singleton` | A single-instance file (no `Name` attribute) |
| `special` | Custom handling required (e.g. `StoryParser` campaign files) |