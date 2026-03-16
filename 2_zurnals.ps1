$outputPath = "$env:USERPROFILE\Documents\Warnings.txt"

$startTime = (Get-Date).AddDays(-3)

$warnings = Get-WinEvent -FilterHashtable @{
    LogName = 'Application'
    Level = 3
    StartTime = $startTime
} -ErrorAction SilentlyContinue

$warnings | Select-Object TimeCreated, Source, Id, Message | 
    Out-File -FilePath $outputPath -Force

$topSources = $warnings | Group-Object -Property Source | 
              Sort-Object -Property Count -Descending | 
              Select-Object -First 3