$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$distDir = Join-Path $repoRoot "dist"
$tempDir = Join-Path $distDir "package"
$manifestPath = Join-Path $repoRoot "manifest.json"
$manifest = Get-Content $manifestPath | ConvertFrom-Json
$version = $manifest.version
$artifactBaseName = "black-red-cyber-firefox-theme-$version"
$zipPath = Join-Path $distDir "$artifactBaseName.zip"
$xpiPath = Join-Path $distDir "$artifactBaseName.xpi"

New-Item -ItemType Directory -Path $distDir -Force | Out-Null

if (Test-Path $tempDir) {
    Remove-Item -Recurse -Force $tempDir
}

if (Test-Path $zipPath) {
    Remove-Item -Force $zipPath
}

if (Test-Path $xpiPath) {
    Remove-Item -Force $xpiPath
}

New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
Copy-Item -Path $manifestPath -Destination $tempDir

Compress-Archive -Path (Join-Path $tempDir "*") -DestinationPath $zipPath
Move-Item -Path $zipPath -Destination $xpiPath
Remove-Item -Recurse -Force $tempDir

Write-Output "Packaged theme at $xpiPath"
