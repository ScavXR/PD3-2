$downloadsPath = "$env:USERPROFILE\Downloads"
$destinationPath = "$env:USERPROFILE\Documents\PDF_Backup.zip"

$cutoffDate = (Get-Date).AddHours(-48)

$filesToBackup = Get-ChildItem -Path $downloadsPath -Filter "*.pdf" | Where-Object {
    $_.LastWriteTime -gt $cutoffDate -or $_.CreationTime -gt $cutoffDate
}

if ($filesToBackup) {
Compress-Archive -Path $filesToBackup.FullName -DestinationPath $destinationPath -Force
}