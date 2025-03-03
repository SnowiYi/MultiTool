Clear-Host
Write-Host ""

$volumes = Get-Volume
foreach ($volume in $volumes) {
    $freeSpaceGB = [math]::Round($volume.SizeRemaining / 1GB, 2)
    Write-Host "Drive : $($volume.DriveLetter)"
    Write-Host "Free Space: $freeSpaceGB GB"
    Write-Host ""
}

Write-Host ""
Write-Host ""
pause