$msStoreApps = winget list --source msstore --accept-source-agreements | Select-Object -Skip 2

$count = ($msStoreApps | Where-Object { $_ -match '\S' }).Count

if ($null -eq $count) { $count = 0 }

Write-Host "Sistema ir instaletas [$count] aplikacijas no Microsoft Store."