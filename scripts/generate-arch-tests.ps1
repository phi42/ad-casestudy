#!/usr/bin/env pwsh
# Generate Architecture Tests from ADR Rules
# This script regenerates all architecture tests from the .rule files

$ErrorActionPreference = "Stop"

Write-Host "Generating architecture tests from ADR rules..." -ForegroundColor Cyan

# Define rule IDs to process
$ruleIds = @('0004', '0005', '0006', '0009', '0010', '0014', '0015', '0016', '0017')

# Generate tests for each rule
$count = 0
foreach ($ruleId in $ruleIds) {
    $rulePath = ".\docs\architecture-decision-log\$ruleId.rule"
    
    if (Test-Path $rulePath) {
        Write-Host "  + Processing ADR $ruleId..." -ForegroundColor Gray
        & .\ade.exe compile -i $rulePath -o ./rules -p csharp
        
        if ($LASTEXITCODE -eq 0) {
            $count++
        } else {
            Write-Host "  X Failed to process ADR $ruleId" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "  ! Rule file not found: $rulePath" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Copying generated tests to ArchTests project..." -ForegroundColor Cyan

# Ensure destination directory exists
$destDir = "src\Tests\ArchTests\Generated"
if (-not (Test-Path $destDir)) {
    New-Item -Path $destDir -ItemType Directory -Force | Out-Null
}

# Copy generated files
Copy-Item -Path "rules\*.g.cs" -Destination $destDir -Force

$copiedFiles = (Get-ChildItem "$destDir\*.g.cs").Count

Write-Host ""
Write-Host "[OK] Successfully generated $count test files" -ForegroundColor Green
Write-Host "[OK] Copied $copiedFiles files to $destDir" -ForegroundColor Green
Write-Host ""
Write-Host "You can now run the tests with:" -ForegroundColor Cyan
Write-Host "  dotnet test src/Tests/ArchTests/CompanyName.MyMeetings.ArchTests.csproj" -ForegroundColor White
