$logFile = "Services.log"

$services = @("Spooler", "wuauserv")

foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
   $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$logMessage = "[$timestamp] Service $($service.Name) is in $($service.Status)."


$logMessage | Out-File -FilePath $logFile -Append 
 }
}
