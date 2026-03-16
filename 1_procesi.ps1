$outputPath = "$env:USERPROFILE\Documents\LargeProcesses.csv"
Get-Process | Where-Object {
    $_.WorkingSet -gt 150MB -and $_.Name -ne "msedge"
} | Select-Object Name, Id, WorkingSet | Export-Csv -Path $outputPath -NoTypeInformation