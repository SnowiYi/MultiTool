Clear-Host
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Relaunching with administrator privileges..."
    Start-Process powershell.exe -Verb RunAs -ArgumentList $PSCommandPath
    exit
}

# Check if Hyper-V module is available
if (-not (Get-Module -ListAvailable -Name Hyper-V)) {
    Write-Host "`n[ERROR] Hyper-V PowerShell module not found" -ForegroundColor Red
    Write-Host "This script requires the Hyper-V role to be installed." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Import Hyper-V module
Import-Module Hyper-V

# Get all running VMs
Write-Host "`nGetting running virtual machines..." -ForegroundColor Cyan
$runningVMs = Get-VM | Where-Object { $_.State -eq 'Running' }

# Check if any VMs are running
if ($runningVMs.Count -eq 0) {
    Write-Host "`n[INFO] No running virtual machines found." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Display running VMs
Write-Host "`nFound $($runningVMs.Count) running virtual machines:" -ForegroundColor Green
$runningVMs | Format-Table Name, State, CPUUsage, MemoryAssigned -AutoSize

# Confirm restart
Write-Host "`nThis will restart all running virtual machines." -ForegroundColor Yellow
$confirmation = Read-Host "Do you want to continue? (Y/N)"
if ($confirmation -ne 'Y' -and $confirmation -ne 'y') {
    Write-Host "`nOperation cancelled." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Restart VMs
Write-Host "`nRestarting virtual machines..." -ForegroundColor Cyan
$totalVMs = $runningVMs.Count
$currentVM = 0

foreach ($vm in $runningVMs) {
    $currentVM++
    $percentComplete = ($currentVM / $totalVMs) * 100
    
    Write-Progress -Activity "Restarting Virtual Machines" -Status "Processing $($vm.Name)" `
                  -PercentComplete $percentComplete -CurrentOperation "[$currentVM of $totalVMs]"
    
    try {
        Write-Host "Restarting VM: $($vm.Name)..." -ForegroundColor Cyan
        Restart-VM -VM $vm -Force
        Write-Host "   [SUCCESS] Restarted $($vm.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "   [ERROR] Failed to restart $($vm.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Progress -Activity "Restarting Virtual Machines" -Completed

# Check status of VMs after restart
Write-Host "`nWaiting for virtual machines to complete restart..." -ForegroundColor Cyan
Start-Sleep -Seconds 5
Clear-Host

Write-Host "`nCurrent status of virtual machines:" -ForegroundColor Green
Get-VM | Where-Object { $runningVMs.Name -contains $_.Name } | 
    Format-Table Name, State, Status, CPUUsage, MemoryAssigned -AutoSize

Write-Host "`nOperation completed. Press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")#########################################################################
# Hyper-V Virtual Machine Restart Script
# Description: Restarts all running Hyper-V virtual machines
# Created: March 2025
#########################################################################

# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "`n[ERROR] This script must be run as Administrator" -ForegroundColor Red
    Write-Host "Please restart PowerShell as Administrator and try again." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Check if Hyper-V module is available
if (-not (Get-Module -ListAvailable -Name Hyper-V)) {
    Write-Host "`n[ERROR] Hyper-V PowerShell module not found" -ForegroundColor Red
    Write-Host "This script requires the Hyper-V role to be installed." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Import Hyper-V module
Import-Module Hyper-V

# Get all running VMs
Write-Host "`nGetting running virtual machines..." -ForegroundColor Cyan
$runningVMs = Get-VM | Where-Object { $_.State -eq 'Running' }

# Check if any VMs are running
if ($runningVMs.Count -eq 0) {
    Write-Host "`n[INFO] No running virtual machines found." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Display running VMs
Write-Host "`nFound $($runningVMs.Count) running virtual machines:" -ForegroundColor Green
$runningVMs | Format-Table Name, State, CPUUsage, MemoryAssigned -AutoSize

# Confirm restart
Write-Host "`nThis will restart all running virtual machines." -ForegroundColor Yellow
$confirmation = Read-Host "Do you want to continue? (Y/N)"
if ($confirmation -ne 'Y' -and $confirmation -ne 'y') {
    Write-Host "`nOperation cancelled." -ForegroundColor Yellow
    Write-Host "Press any key to exit..."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Restart VMs
Write-Host "`nRestarting virtual machines..." -ForegroundColor Cyan
$totalVMs = $runningVMs.Count
$currentVM = 0

foreach ($vm in $runningVMs) {
    $currentVM++
    $percentComplete = ($currentVM / $totalVMs) * 100
    
    Write-Progress -Activity "Restarting Virtual Machines" -Status "Processing $($vm.Name)" `
                  -PercentComplete $percentComplete -CurrentOperation "[$currentVM of $totalVMs]"
    
    try {
        Write-Host "Restarting VM: $($vm.Name)..." -ForegroundColor Cyan
        Restart-VM -VM $vm -Force
        Write-Host "   [SUCCESS] Restarted $($vm.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "   [ERROR] Failed to restart $($vm.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Progress -Activity "Restarting Virtual Machines" -Completed

# Check status of VMs after restart
Write-Host "`nWaiting for virtual machines to complete restart..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

Write-Host "`nCurrent status of virtual machines:" -ForegroundColor Green
Get-VM | Where-Object { $runningVMs.Name -contains $_.Name } | 
    Format-Table Name, State, Status, CPUUsage, MemoryAssigned -AutoSize

Write-Host "`nOperation completed. Press any key to exit..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")