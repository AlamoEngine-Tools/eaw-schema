# Contributing to the Schema

This guide explains how to add or improve schema definitions. The schema is pure YAML, no C# changes are required for most contributions.

## When to contribute

| Scenario | What to do |
|---|---|
| A tag is missing or has the wrong type | Edit the relevant `tags/*.yaml` file |
| An enum value is missing or misdescribed | Edit the relevant `enums/*.yaml` file |
| A `BehaviorModule` token is missing | Edit `hardcoded/BehaviorModule.yaml` |
| A new object type is needed | Add an entry to `types.yaml` |
| A new registry file should be recognised | Add an entry to `meta/metafiles.yaml` |

## Prerequisites

- PowerShell 7+ (`pwsh`): used by the hashing script
- A text editor that understands YAML indentation

## Editing a tag file

Tag files live in `eaw/tags/`. Each file's stem is the `typeName` exactly as it appears in `types.yaml`.

### Adding a tag

Append a new entry to the `tags:` list:

```yaml
tags:
  # ... existing tags ...
  - tag: My_New_Tag
    type: Float
    description:
      en: "What this tag controls."
```

Fill in only the fields that apply:

| Field | When to include                                           |
|---|-----------------------------------------------------------|
| `type` | Always                                                    |
| `referenceKind` | When `type` is `NameReference` or `NameReferenceList`     |
| `referenceType` | When `referenceKind` is `xmlObject`                       |
| `enumName` | When `type` is `DynamicEnumValue` or `HardcodedEnumValue` |
| `deprecated: true` | When the engine ignores the tag in current versions       |
| `availableSince` | When the tag was added in a specific patch                |
| `description.en` | Always, even a one-sentence description helps             |

### Marking a tag as deprecated

```yaml
  - tag: Old_Tag
    type: Boolean
    deprecated: true
    description:
      en: "No longer used by the engine. Kept for backwards compatibility."
```

### Adding or improving a description

Descriptions are written under `description:` as a localised block. Only `en` (English) exists today:

```yaml
    description:
      en: "Single sentence. Describes what the engine does with this value."
```

Keep descriptions factual and concise, one or two sentences. If behaviour varies across event types or game modes, note that. Avoid repeating the tag name verbatim.

If a description is a best-guess inferred from game data rather than documented engine behaviour, append: `(Type annotation is a best-guess inferred from observed game data, may need refinement.)`

## Editing an enum file

### Adding a value to a schema-fixed enum

```yaml
values:
  # ... existing values ...
  - name: NEW_VALUE
    description:
      en: "What this value means."
    notes:
      en: "Optional: usage caveats, which tags use it, etc."
```

Do **not** add a `values` block to `dynamicXml` enums - their values come from game XML files at runtime.

### Adding a new schema-fixed enum

1. Create `eaw/enums/MyNewEnum.yaml`:

```yaml
name: MyNewEnum
description:
  en: "What this enum represents."
values:
  - name: FIRST_VALUE
    description:
      en: "..."
```

2. Add `"enums/MyNewEnum.yaml"` to the `enums` array in `eaw/_index.json` (in alphabetical order).

3. Regenerate `baselineHash` (see below).

### Adding a new dynamic XML enum

```yaml
name: MyDynamicEnum
kind: dynamicXml
sourceFile: data/xml/enum/mydynamicenum.xml
description:
  en: "..."
```

If values combine with `|`, also add `isBitfield: true`.

## Adding a new object type

Open `eaw/types.yaml` and add an entry in alphabetical order by `typeName`:

```yaml
types:
  # ...
  - typeName: MyNewType
    nameTag: Name
    description:
      en: "What objects of this type represent."
```

Omit `nameTag` for singleton types (those with no `Name` attribute in their XML).

## Adding a metafile mapping

Open `eaw/meta/metafiles.yaml` and add an entry under `metafiles:`:

```yaml
  - path: data/xml/myregistryfile.xml
    metaFileType: fileRegistry
    types:
      - MyNewType
    description:
      en: "All files registered here are of type MyNewType."
```

Choose `metaFileType` from: `fileRegistry`, `directContent`, `singleton`, `special`.

## Regenerating `_index.json` and `baselineHash`

Run this after **any** YAML file change (including edits to descriptions):

```powershell
$root  = "schema/eaw"
$tags  = Get-ChildItem $root/tags  -Filter "*.yaml" | Sort-Object Name | ForEach-Object { "tags/$($_.Name)" }
$enums = Get-ChildItem $root/enums -Filter "*.yaml" | Sort-Object Name | ForEach-Object { "enums/$($_.Name)" }
$allRels = @($tags) + @("types.yaml") + @($enums) + @("hardcoded/BehaviorModule.yaml") + @("meta/metafiles.yaml")
$sha = [System.Security.Cryptography.IncrementalHash]::CreateHash(
    [System.Security.Cryptography.HashAlgorithmName]::SHA256)
foreach ($rel in $allRels) {
    $sha.AppendData([System.IO.File]::ReadAllBytes("$root/$rel"))
}
$hash = [System.Convert]::ToHexString($sha.GetHashAndReset()).ToLower()
[ordered]@{
    types    = @("types.yaml")
    tags     = @($tags)
    enums    = @($enums)
    hardcoded = @("hardcoded/BehaviorModule.yaml")
    meta     = @("meta/metafiles.yaml")
    baselineHash = $hash
} | ConvertTo-Json -Depth 3 | Set-Content $root/_index.json -Encoding utf8NoBOM
```

`baselineHash` is a SHA-256 over every listed YAML file in manifest order (Tags → Types → Enums → Hardcoded → Meta). `HttpSchemaProvider` uses it to validate its cached copy without re-downloading every file.

## Style conventions

- **YAML indentation**: 2 spaces, no tabs.
- **Tag names**: preserve the exact casing used in game XML (e.g. `My_Tag`, not `my_tag`).
- **Type names and enum names**: PascalCase, matching the engine's `KeyMapTable` or C++ enum name.
- **Descriptions**: plain English, one or two sentences, no trailing period required. Use present tense ("Controls the…", "Defines the…").
- **Ordering**: entries within a `tags:` list follow the order they appear in `DatabaseMapExport.xml`. Enum `values:` follow the order they appear in the C++ source or XML file. File lists in `_index.json` are alphabetical.
- **No extra fields**: do not add fields not listed in `README.md`. Unknown fields are silently ignored by `YamlDotNet` but create maintenance confusion.

## Validation

Every YAML file here is validated against a JSON Schema in [`.schemas/`](.schemas) by the
`validate-schema` workflow, on push and on every pull request.

| Files | Schema |
| ----- | ------ |
| `*/tags/*.yaml` | `.schemas/tag-file.schema.json` |
| `*/enums/*.yaml` | `.schemas/enum-file.schema.json` |
| `*/hardcoded/*.yaml` | `.schemas/hardcoded-set-file.schema.json` |
| `*/meta/*.yaml` | `.schemas/metafiles-file.schema.json` |
| `*/types.yaml` | `.schemas/types-file.schema.json` |

This exists because the consuming C# loader is deliberately forgiving, so mistakes here are silent
rather than loud:

- A **YAML syntax error** (a stray space before `description:` is enough) makes the *entire* game
  schema fail to load - no hover, no completion, no validation anywhere - and the exception names no
  file.
- An **unknown `type:`** makes the loader skip that tag completely, so the tag simply does not exist.
- An unknown **`referenceKind`/`semanticType`/`variantMode`** silently falls back to a default.
- A **misspelled key** is ignored outright (`IgnoreUnmatchedProperties`).

The schemas are therefore stricter than the loader on purpose, and reject values it would merely
warn about. They accept both camelCase and PascalCase for enum-ish fields, because the repo mixes
them and the goal is to catch wrong names rather than enforce a house style.

Install [redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
to get the same checks live while editing - `.vscode/settings.json` already maps the schemas.

**When the C# side gains a new value** (an `XmlValueType` member, a `ReferenceKind`, ...), add it to
the corresponding `enum` list in `.schemas/`, or valid data will start failing CI.
