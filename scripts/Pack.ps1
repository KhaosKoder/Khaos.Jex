<#
.SYNOPSIS
    Creates NuGet packages for Khaos.JEX.
.DESCRIPTION
    This script packs the Khaos.JEX library as a NuGet package.
    For VS Code extension packaging, use the scripts in Khaos.Jex.VSCode.
#>

[CmdletBinding()]
param(
    [ValidateSet('Debug', 'Release')]
    [string]$Configuration = 'Release',
    [switch]$NoBuild
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$solutionFile = Get-ChildItem -Path $repoRoot -Filter '*.sln' -File | Select-Object -First 1

if (-not $solutionFile) { throw "No solution file found in $repoRoot" }

$solutionPath = $solutionFile.FullName
$solutionName = $solutionFile.BaseName
$artifactsDir = Join-Path $repoRoot 'artifacts'

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Packing: $solutionName" -ForegroundColor Cyan
Write-Host "  Configuration: $Configuration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

if (-not (Test-Path $artifactsDir)) {
    New-Item -ItemType Directory -Path $artifactsDir | Out-Null
}

Push-Location $repoRoot
try {
    $buildArg = if ($NoBuild) { '--no-build' } else { '' }
    
    Write-Host "[Pack] Creating NuGet packages..." -ForegroundColor Yellow
    dotnet pack $solutionPath -c $Configuration $buildArg -o $artifactsDir
    
    Write-Host "[Pack] Packages created successfully." -ForegroundColor Green
    
    Write-Host "Created packages:" -ForegroundColor Cyan
    Get-ChildItem -Path $artifactsDir -Filter '*.nupkg' | ForEach-Object {
        Write-Host "  - $($_.Name)" -ForegroundColor White
    }
}
finally { Pop-Location }
