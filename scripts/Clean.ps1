<#
.SYNOPSIS
    Cleans build artifacts.
#>

[CmdletBinding()]
param(
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Cleaning: $(Split-Path $repoRoot -Leaf)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

$foldersToClean = @('bin', 'obj', 'artifacts', 'TestResults', 'BenchmarkDotNet.Artifacts')

foreach ($folder in $foldersToClean) {
    $paths = Get-ChildItem -Path $repoRoot -Directory -Recurse -Filter $folder -ErrorAction SilentlyContinue
    foreach ($path in $paths) {
        Write-Host "[Clean] Removing: $($path.FullName)" -ForegroundColor Yellow
        Remove-Item -Path $path.FullName -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Clean VS Code extension build artifacts
$vsCodeExtDir = Join-Path $repoRoot 'Khaos.Jex.VSCode'
if (Test-Path $vsCodeExtDir) {
    $vsCodeFoldersToClean = @('out', 'server', 'node_modules')
    foreach ($folder in $vsCodeFoldersToClean) {
        $path = Join-Path $vsCodeExtDir $folder
        if (Test-Path $path) {
            Write-Host "[Clean] Removing: $path" -ForegroundColor Yellow
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

Write-Host "[Clean] Clean completed." -ForegroundColor Green
