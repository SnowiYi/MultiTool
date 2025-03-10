@echo off
title Utility - By Blanco
chcp 65001 >nul
setlocal enabledelayedexpansion
set "ORIGINAL_DIR=%CD%"
call :banner

REM ----------------------------------------------------------------------------------------------------------------------------

:menu
cls
call :banner2
echo                       [38;2;255;94;77m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;191;136m      Commands     ^| [0m [0m
echo                       [38;2;255;94;77m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;5;231m
echo                                                          [38;2;255;191;136m Welcome[38;5;231m
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo       ╔ (1) Scripts
echo       ╠ (2) Tools
echo       ╠ (3) Commands
echo       ╠ (4) Credits
set /p input=.%BS%      ╚ 
if "%input%"=="" goto menu
if /I %input% LSS 1 goto menu
if /I %input% EQU 1 goto script
if /I %input% EQU 2 goto tools
if /I %input% EQU 3 goto commands
if /I %input% EQU 4 goto credits
if /I %input% GTR 4 goto menu

REM ----------------------------------------------------------------------------------------------------------------------------

:script
cd /d "%ORIGINAL_DIR%\files\scripts\" 2>nul || (
    echo Scripts folder not found. 
    timeout /t 2 >nul
    goto menu
)
cls
call :banner2
echo                       [38;2;255;191;136m     Main Menu     ^|[38;2;255;94;77m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;191;136m      Commands     ^| [0m [0m
echo                       [38;2;255;191;136m───────────────────┘[38;2;255;94;77m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;5;231m
echo                                                    [38;2;255;191;136m Type exit to exit[38;5;231m
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo       ╔ (1) IP Changer.ps1
echo       ╠ (2) Réseau.ps1
echo       ╠ (3) Latency.ps1
echo       ╠ (4) DiskDrive.ps1 (WIP)
echo       ╠ (5) Massgrave - Windows Activation
echo       ╠ (6) Song.ps1 (Do not execute in a busy space)
set /p input=.%BS%      ╚ 
if "%input%"=="" goto script
if /I "%input%"=="exit" goto menu
if /I %input% LSS 1 goto script
if /I %input% EQU 1 ( if exist "IP.ps1" (powershell -ExecutionPolicy Bypass -File "IP.ps1") else (echo File not found & pause) )
if /I %input% EQU 2 ( if exist "Réseau.ps1" (powershell -ExecutionPolicy Bypass -File "Réseau.ps1") else (echo File not found & pause) )
if /I %input% EQU 3 ( if exist "Latency.ps1" (powershell -ExecutionPolicy Bypass -File "Latency.ps1") else (echo File not found & pause) )
if /I %input% EQU 4 ( if exist "DiskDrive.ps1" (powershell -ExecutionPolicy Bypass -File "DiskDrive.ps1") else (echo File not found & pause) )
if /I %input% EQU 5 ( if exist "Massgrave.ps1" (powershell -ExecutionPolicy Bypass -File "Massgrave.ps1") else (echo File not found & pause) )
if /I %input% EQU 6 ( if exist "song.ps1" (powershell -ExecutionPolicy Bypass -File "song.ps1") else (echo File not found & pause) )
if /I %input% GTR 6 goto script
goto menu

REM ----------------------------------------------------------------------------------------------------------------------------

:tools
cd /d "%ORIGINAL_DIR%\files\tools\" 2>nul || (
    echo Tools folder not found. 
    timeout /t 2 >nul
    goto menu
)
cls
call :banner2
echo                       [38;2;255;191;136m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;94;77m       Tools       ^|[38;2;255;191;136m      Commands     ^| [0m [0m
echo                       [38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;94;77m───────────────────┘[38;2;255;191;136m───────────────────┘[38;5;231m
echo                                                    [38;2;255;191;136m Type exit to exit[38;5;231m
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo       ╔ (1) System Informer
echo       ╠ (2) PuTTY
echo       ╠ (3) Wireshark
set /p input=.%BS%      ╚ 
if "%input%"=="" goto tools
if /I "%input%"=="exit" goto menu       
if /I %input% LSS 1 goto tools
if /I %input% EQU 1 ( if exist "SystemInformer.exe" (start SystemInformer.exe) else (echo File not found & pause) )
if /I %input% EQU 2 ( if exist "putty.exe" (start putty.exe) else (echo File not found & pause) )
if /I %input% EQU 3 ( if exist "WiresharkPortable64.exe" (start WiresharkPortable64.exe) else (echo File not found & pause) )
if /I %input% GTR 3 goto tools
goto menu

REM ----------------------------------------------------------------------------------------------------------------------------

:commands
cls
call :banner2
echo                       [38;2;255;191;136m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;94;77m      Commands     ^| [0m [0m
echo                       [38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;94;77m───────────────────┘[38;5;231m
echo                                                    [38;2;255;191;136m Type exit to exit[38;5;231m
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo       ╔ (1) Route Print - Show the Routing Table
echo       ╠ (2) Netstat - Show the traffic on the network adapter
echo       ╠ (3) NMap - Scan the network
echo       ╠ (4) sfc /scannow - Scan and repair the system files
echo       ╠ 
echo       ╠ (10) Restart in UEFI
set /p input=.%BS%      ╚ 
if "%input%"=="" goto commands
if /I "%input%"=="exit" goto menu   
if /I %input% LSS 1 goto commands  
if /I %input% EQU 1 (
    cls
    route print
    pause
    goto commands
)
if /I %input% EQU 2 (
    cls
    netstat
    pause
    goto commands
)
if /I %input% EQU 3 (
    cls
    where nmap >nul 2>&1
    if !errorlevel! neq 0 (
        echo NMap not found or not in PATH. Please install it first.
        pause
        goto commands
    )
    nmap -sn 192.168.0.0/16
    pause
    goto commands
)
if /I %input% EQU 4 (
    cls
    echo Running System File Checker...
    sfc /scannow
    pause
    goto commands
)

if /I %input% EQU 10 (
    cls
    echo System will restart in UEFI/BIOS in 5 seconds...
    echo Press Ctrl+C to cancel.
    timeout /t 5
    shutdown /r /fw /t 0 /f
)
if /I %input% GTR 10 goto commands
goto menu

REM ----------------------------------------------------------------------------------------------------------------------------

:credits
cls
call :banner
goto menu

REM ----------------------------------------------------------------------------------------------------------------------------

:banner
cls
echo.
echo [38;2;255;94;77m                                                    ++                         
echo [38;2;255;94;77m                                                    ++++                       
echo [38;2;255;94;77m                                                    ++++++=                    
echo [38;2;255;94;77m                                                    +++++++++                  
echo [38;2;255;94;77m                                                  ++++++++++++                 
echo [38;2;255;94;77m                                                +++ ++++++++++++               
echo [38;2;255;94;77m                                            +++++++++++++++++++++              
echo [38;2;255;94;77m                                            +++++++++++++++++++++              
echo [38;2;255;94;77m                                              ++-        == ++++++             
echo [38;2;255;94;77m                                                    +++=     +++++             
echo [38;2;255;94;77m                                                   ++++++    =++++             
echo [38;2;255;94;77m                                                  ++++++++     +++             
echo [38;2;255;94;77m                                                  ++++++++     ++              
echo [38;2;255;94;77m                                                   +++++++     +               
echo [38;2;255;94;77m                                           +++++++++++++++                     
echo [38;2;255;94;77m                                         +++++++++++++++++                     
echo [38;2;255;94;77m                                        ++++++++++++++++++      +++++++++++    
echo [38;2;255;94;77m                                         ++++++++++++++:    =++++++++++++++++  
echo [38;2;255;94;77m                                          =+++++++=      ++++++++++++++++   ++ 
echo [38;2;255;94;77m                                       ++            +++++++++++++++++       +:
echo [38;2;255;94;77m                                       -+++++++++++++++++++++++++++++++=     ++
echo [38;2;255;94;77m                                        +++++++++++++++++++++++++++++        ++
echo [38;2;255;94;77m                                         ++++++++++++++++++++++++++++++++++  ++
echo [38;2;255;94;77m                                          +++++++++++++++++++++++-         +=+ 
echo [38;2;255;94;77m                                            ++++++++++++++++               ++  
echo [38;2;255;94;77m                                               +++++++-                    +    
echo.
echo                                                       By [38;2;255;115;85mB[38;2;255;115;85ml[38;2;255;140;102ma[38;2;255;165;120mn[38;2;255;191;136mco[0m
echo.
timeout /t 3 /nobreak >nul
exit /b

REM ----------------------------------------------------------------------------------------------------------------------------

:banner2
cls
echo.
echo [38;2;255;94;77m                                                          +             
echo [38;2;255;94;77m                                                          +++         
echo [38;2;255;94;77m                                                        ++ ++++     
echo [38;2;255;94;77m                                                     +++++++++++        
echo [38;2;255;94;77m                                                        ++    ++        
echo [38;2;255;94;77m                                                         +++  ++         
echo [38;2;255;94;77m                                                      ++++++  +         
echo [38;2;255;94;77m                                                    ++++++++             
echo [38;2;255;94;77m                                                    ++++++++  +++++++    
echo [38;2;255;94;77m                                                           +++++++++    +
echo [38;2;255;94;77m                                                    ++++++++++++++  +++  
echo [38;2;255;94;77m                                                      ++++++         +   [0m
echo.
exit /b