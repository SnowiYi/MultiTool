if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Relaunching with administrator privileges..."
    Start-Process powershell.exe -Verb RunAs -ArgumentList $PSCommandPath
    exit
}

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$batFilePath = Join-Path -Path $scriptPath -ChildPath "song.bat"
Start-Process -FilePath $batFilePath

$code = @"
    [DllImport("user32.dll")]
    public static extern bool BlockInput(bool fBlockIt);
"@

$userInput = Add-Type -MemberDefinition $code -Name UserInput -Namespace UserInput -PassThru

function Disable-UserInput($seconds) {
    $userInput::BlockInput($true)
    Start-Sleep $seconds
    $userInput::BlockInput($false)
}

Disable-UserInput -seconds 10 | Out-Null
pause