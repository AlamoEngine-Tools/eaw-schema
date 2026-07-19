# Schema

This directory contains the canonical schema definitions for Petroglyph Star Wars game XML data files. The schema drives editor intelligence (completions, hover documentation, and diagnostics) in the LSP server.

## Structure

```
schema/
  eaw/                Empire at War schema (complete)
    _index.json       Manifest consumed by HttpSchemaProvider; carries baselineHash
    types.yaml        Object type registry (124 types)
    tags/*.yaml       123 tag files - one per KeyMapTable from DatabaseMapExport.xml
    enums/*.yaml      44 enum definition files
    hardcoded/
      BehaviorModule.yaml   Hardcoded behaviour-module token list
    meta/
      metafiles.yaml  Metafile type mappings (file registries, singletons, etc.)
  foc/                Forces of Corruption schema (work in progress - extends eaw)
    _index.json
    types.yaml
```

## Coverage

| Game | Tags | Enums | Hardcoded | Meta | Status |
|---|---|---|---|---|--|
| Empire at War (`eaw`) | 123 | 44 | 1 | 1 | Work in progress |
| Forces of Corruption (`foc`) | - | - | - | - | Work in progress |

FoC inherits all EaW definitions at runtime. The `foc/` directory will carry only overrides and additions that differ from the base game.

## `_index.json` manifest

Consumed by `HttpSchemaProvider` when loading schema from a remote URL. Contains:

- `types`, `tags`, `enums`, `hardcoded`, `meta` - ordered lists of relative paths for each category.
- `baselineHash` - SHA-256 of every listed YAML file's raw bytes in manifest order (Tags → Types → Enums → Hardcoded → Meta). Used for a single-hash cache-validity check instead of re-reading every file.

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
    type: Boolean
    referenceKind: xmlObject        # omit when type is not a reference
    referenceType: SFXEvent         # omit when type is not a reference
    enumName: MyEnum                # required when type is DynamicEnumValue or HardcodedEnumValue
    deprecated: true                # omit or false if not deprecated
    availableSince: "1.05"          # omit if available since release
    description:
      en: "English description."
```

### `type` values

| Type | Description |
|---|---|
| `Boolean` | `Yes` / `No` |
| `Float` | Floating-point number (lenient parsing) |
| `FloatList` | Space- or comma-separated floats |
| `FloatVector2` | Two floats |
| `FloatVector3` | Three floats |
| `FloatVector3List` | List of `FloatVector3` values |
| `FloatVector4` | Four floats |
| `Int` | Signed integer |
| `IntList` | Space- or comma-separated signed integers |
| `Uint` | Unsigned integer |
| `NormalizedFloat` | Float in [0, 1] |
| `Rgba` | `R G B A` colour (0–255 components) |
| `NameReference` | Reference to a named game object |
| `NameReferenceList` | Space-separated list of `NameReference` values |
| `DynamicEnumValue` | Single value from a named dynamic-XML enum |
| `HardcodedEnumValue` | Single value from a named hardcoded C++ enum |
| `AudioParamInt` | Audio-specific integer parameter |
| `SfxPercentage` | Audio probability float (0–1) |
| `SfxCount` | Audio play-count integer |
| `HardwareUInt` | Hardware capability flags (hexadecimal) |
| `ShaderVersionHex` | Shader version in hex format |
| `VendorIdHex` | Hardware vendor ID in hex format |
| `Audio3dProvider` | Named 3-D audio provider |
| `CableRenderMode` | Cable render-mode token |
| `PositionLabel` | Position label string |
| `PrerequisiteExpression` | Boolean expression of prerequisite names |
| `ProjectileCategory` | Projectile category token |
| `UvSlotIndex` | UV slot index integer |
| `ShipClassType` | Ship class type token |

### `referenceKind` values

Used only when `type` is `NameReference` or `NameReferenceList`.

| Value | Meaning |
|---|---|
| `xmlObject` | Reference to a named XML game object; `referenceType` specifies the target type |
| `audioFile` | Reference to an audio sample filename |
| `localisationKey` | Reference to a localisation string key |
| `unknown` | Reference target unknown / polymorphic (e.g. story event parameters) |

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