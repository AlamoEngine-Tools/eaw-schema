# Schema

This directory contains the canonical schema definitions for Petroglyph Star Wars game XML data files. The schema drives editor intelligence (completions, hover documentation, and diagnostics) in the LSP server.

## Structure

```
schema/
  eaw/          Empire at War schema
  foc/          Forces of Corruption schema (extends eaw)
```

Each game directory contains:

| File / Folder | Contents |
|---|---|
| `_index.json` | Manifest listing all tag, type, and enum files; consumed by `HttpSchemaProvider` |
| `types.yaml` | One entry per game object type (`typeName`, optional `nameTag`, optional `description`) |
| `tags/*.yaml` | One file per XML KeyMapTable; lists every parameter with its value type and metadata |
| `enums/*.yaml` | Enum definitions — either schema-fixed (C++ enums) or dynamic XML enums |

## Tag files

Each `tags/*.yaml` file corresponds to one `KeyMapTable` from `DatabaseMapExport.xml`. It lists every XML parameter the engine recognises for that table, along with:

- `type` — value type code (e.g. `Boolean`, `Float`, `NameReference`, `DynamicEnumValue`)
- `referenceType` — for reference types, the target object kind (e.g. `SFXEvent`, `Faction`)
- `enumName` — for enum types, the name of the enum definition to validate against
- `deprecated`, `availableSince`, `description` — documentation metadata

## Enum files

Two kinds of enum exist:

**Schema-fixed** (`kind` omitted or `schemaFixed`) — hardcoded C++ enums whose values are stable across all game installations. The YAML values list is authoritative.

**Dynamic XML** (`kind: dynamicXml`) — enums defined in the game's `Xml/Enum/*.xml` files. The YAML carries no `values` block; values are loaded at runtime from the file named by `sourceFile`. Mods may extend these enums. Two of them (`GameObjectCategoryType`, `GameObjectPropertiesType`) are bitfields where values combine with `|`.
