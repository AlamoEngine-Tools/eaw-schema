# Updates the baselineHash field in schema/eaw/_index.json.
# Run after any schema YAML file changes. Safe to run as a git pre-commit hook.

$ErrorActionPreference = "Stop"
$root = Join-Path $PSScriptRoot "eaw"
$indexPath = Join-Path $root "_index.json"

$index = Get-Content $indexPath -Raw | ConvertFrom-Json

# The rewrite below reconstructs the manifest from a fixed field list, so anything not named there
# is dropped. schemaVersion is load-bearing (the server refuses a schema whose MAJOR it does not
# support), so fail loudly rather than silently emitting a manifest without it.
if (-not $index.schemaVersion) {
    throw "schemaVersion missing from $indexPath - add it before running this script."
}

$allRels = @($index.tags) + @($index.types) + @($index.enums) + @($index.hardcoded) + @($index.meta)

$sha = [System.Security.Cryptography.IncrementalHash]::CreateHash(
    [System.Security.Cryptography.HashAlgorithmName]::SHA256)
foreach ($rel in $allRels) {
    $sha.AppendData([System.IO.File]::ReadAllBytes("$root/$rel"))
}
$hash = [System.Convert]::ToHexString($sha.GetHashAndReset()).ToLower()

if ($index.baselineHash -eq $hash) {
    Write-Host "baselineHash unchanged: $hash"
    exit 0
}

[ordered]@{
    schemaVersion = $index.schemaVersion
    types         = $index.types
    tags          = $index.tags
    enums         = $index.enums
    hardcoded     = $index.hardcoded
    meta          = $index.meta
    baselineHash  = $hash
} | ConvertTo-Json -Depth 3 | Set-Content $indexPath -Encoding utf8NoBOM

git add $indexPath
Write-Host "baselineHash updated: $hash"
