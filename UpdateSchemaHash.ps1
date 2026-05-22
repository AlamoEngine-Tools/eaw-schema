# Updates the baselineHash field in schema/eaw/_index.json.
# Run after any schema YAML file changes. Safe to run as a git pre-commit hook.

$ErrorActionPreference = "Stop"
$root = Join-Path $PSScriptRoot "eaw"
$indexPath = Join-Path $root "_index.json"

$index = Get-Content $indexPath -Raw | ConvertFrom-Json

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
    types        = $index.types
    tags         = $index.tags
    enums        = $index.enums
    hardcoded    = $index.hardcoded
    meta         = $index.meta
    baselineHash = $hash
} | ConvertTo-Json -Depth 3 | Set-Content $indexPath -Encoding utf8NoBOM

git add $indexPath
Write-Host "baselineHash updated: $hash"
