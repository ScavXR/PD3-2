$defenderStatus = Get-MpComputerStatus

$score = 100

if ($defenderStatus.RealTimeProtectionEnabled -eq $false) {
    $score -= 50
}

if ($defenderStatus.AntivirusSignatureAge -gt 3) {
    $score -= 20
}

if ($null -eq $defenderStatus.QuickScanAge -or $defenderStatus.QuickScanAge -gt 7) {
    $score -= 20
}

if ($score -lt 0) { $score = 0 }

Write-Host "Sistemas drosibas reitings: $score / 100"