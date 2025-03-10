@echo off
title Utility - By Blanco
chcp 65001 >nul
setlocal enabledelayedexpansion
call :banner

/*----------------------------------------------------------------------------------------------------------------------------*/

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
echo       ╠ (4) Superviseur
echo       ╠ (5) Credits
set /p input=.%BS%      ╚ 
if /I %input% LSS 1 call :menu
if /I %input% EQU 1 call :script
if /I %input% EQU 2 call :tools
if /I %input% EQU 3 call :commands
if /I %input% EQU 4 call :supervisor
if /I %input% EQU 5 call :credits
if /I %input% GTR 5 call :menu

/*----------------------------------------------------------------------------------------------------------------------------*/

:script
cd files\scripts\
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
echo       ╠ (4) Vm - Restart All Vms
echo       ╠ (5) DiskDrive.ps1 (WIP)
echo       ╠ (6) Massgrave - Windows Activation
echo       ╠ (7) Song.ps1 (Do not execute in a busy space)
set /p input=.%BS%      ╚ 
if /I %input% EQU exit call :menu
if /I %input% LSS 1 call :script
if /I %input% EQU 1 start IP.ps1
if /I %input% EQU 2 start Réseau.ps1
if /I %input% EQU 3 start Latency.ps1 
if /I %input% EQU 4 start VM.ps1
fi /I %input% EQU 5 start DiskDrive.ps1
if /I %input% EQU 6 start Massgrave.ps1
if /I %input% EQU 7 start song.ps1 
if /I %input% GTR 6 call :script
call :menu

/*----------------------------------------------------------------------------------------------------------------------------*/

:tools
cd files\tools\
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
if /I %input% EQU exit call :menu       
if /I %input% LSS 1 call :tools
if /I %input% EQU 1 start SystemInformer.exe
if /I %input% EQU 2 start putty.exe
if /I %input% EQU 3 start WiresharkPortable64.exe
if /I %input% GTR 3 call :tools
call :menu

/*----------------------------------------------------------------------------------------------------------------------------*/

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
if /I %input% EQU exit call :menu   
if /I %input% LSS 1 call :commands  
if /I %input% EQU 1 ( cls
route print
pause )
if /I %input% EQU 2 ( cls
netstat
pause )
if /I %input% EQU 3 ( cls
nmap -sn 192.168.0.0/16
pause )
if /I %input% EQU 4 ( cls
sfc /scannow)



if /I %input% EQU 10 ( cls
shutdown /r /fw /t 0 /f)
if /I %input% GTR 10 call :commands
call :menu

/*----------------------------------------------------------------------------------------------------------------------------*/

:supervisor
cls
call :banner2
echo                      [38;2;255;191;136m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;191;136m      Commands     ^|
echo                      [38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘
echo                                                   [38;2;255;191;136m Supervision Panel[38;5;231m
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo       ╔ (1) Add item to supervise
echo       ╠ (2) Remove item from supervision
echo       ╠ (3) Start supervision window
set /p input=.%BS%      ╚ 
if /I %input% LSS 1 call :supervisor
if /I %input% EQU 1 call :supervisor_add
if /I %input% EQU 2 call :supervisor_remove
if /I %input% EQU 3 call :supervisor_monitor
if /I %input% EQU exit call :menu
if /I %input% GTR 4 call :supervisor

:supervisor_add
cls
call :banner2
echo                      [38;2;255;191;136m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;191;136m      Commands     ^|
echo                      [38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘
echo                                                    [38;2;255;191;136m Add Item[38;5;231m
echo.
echo  Enter the IP address or hostname to supervise (type 'exit' to cancel):
set /p "supervisorItem="
if /I "%supervisorItem%"=="exit" goto supervisor
if "%supervisorItem%"=="" goto supervisor_add

rem Create hosts directory if it doesn't exist
if not exist "files\supervisor\" mkdir "files\supervisor\" 2>nul

rem Add the item to the supervision list
echo %supervisorItem%>> "files\supervisor\hosts.txt"
echo.
echo [38;2;0;255;0m Item added successfully![0m
timeout /t 2 >nul
goto supervisor

:supervisor_remove
cls
call :banner2
echo                      [38;2;255;191;136m     Main Menu     ^|[38;2;255;191;136m      Scripts      ^|[38;2;255;191;136m       Tools       ^|[38;2;255;191;136m      Commands     ^|
echo                      [38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘[38;2;255;191;136m───────────────────┘
echo                                                   [38;2;255;191;136m Remove Item[38;5;231m
echo.

rem Check if hosts.txt exists
if not exist "files\supervisor\hosts.txt" (
    echo  No items in supervision list.
    timeout /t 2 >nul
    goto supervisor
)

rem Display current items with numbers
echo  Current items in supervision:
echo.
set itemCount=0
for /f "tokens=*" %%a in (files\supervisor\hosts.txt) do (
    set /a "itemCount+=1"
    echo  !itemCount!. %%a
)

if %itemCount% EQU 0 (
    echo  No items in supervision list.
    timeout /t 2 >nul
    goto supervisor
)

echo.
echo  Enter number to remove (or 'exit' to cancel):
set /p "removeItem="
if /I "%removeItem%"=="exit" goto supervisor
if "%removeItem%"=="" goto supervisor_remove

rem Validate input
if %removeItem% LSS 1 goto supervisor_remove
if %removeItem% GTR %itemCount% goto supervisor_remove

rem Remove the specified item
set lineCount=0
set "tempFile=files\supervisor\hosts_temp.txt"
for /f "tokens=*" %%a in (files\supervisor\hosts.txt) do (
    set /a "lineCount+=1"
    if !lineCount! NEQ %removeItem% (
        echo %%a>> "%tempFile%"
    )
)
del "files\supervisor\hosts.txt" 2>nul
ren "%tempFile%" "hosts.txt" 2>nul

echo.
echo [38;2;0;255;0m Item removed successfully![0m
timeout /t 2 >nul
goto supervisor

:supervisor_monitor
cls
if not exist "files\supervisor\hosts.txt" (
    echo No items in supervision list. Please add items first.
    timeout /t 2 >nul
    goto supervisor
)

echo [38;2;255;191;136m                             Supervision Monitor - Press any key to exit                               [0m
echo [38;2;255;191;136m ──────────────────────────────────────────────────────────────────────────────────────────────────────[0m 
echo.

rem Count total hosts
set hostCount=0
for /f "tokens=*" %%a in (files\supervisor\hosts.txt) do set /a hostCount+=1

if %hostCount% EQU 0 (
    echo No items in supervision list. Please add items first.
    timeout /t 2 >nul
    goto supervisor
)

rem Monitor loop
:monitor_loop
cls
echo [38;2;255;191;136m                             Supervision Monitor - Press any key to exit                               [0m
echo [38;2;255;191;136m ──────────────────────────────────────────────────────────────────────────────────────────────────────[0m
echo.
echo    Status  ^|  Host
echo   ─────────┼──────────────────────────────────

rem Check each host
for /f "tokens=*" %%a in (files\supervisor\hosts.txt) do (
    set "status=Offline"
    ping -n 1 -w 2000 %%a | find "TTL=" >nul 2>&1
    if !errorlevel! EQU 0 (
        echo  [38;2;0;255;0m● Online [0m ^|  %%a
    ) else (
        echo  [38;2;255;0;0m● Offline[0m ^|  %%a
    )
)

echo.
echo [38;2;255;191;136m Refreshing every 10 seconds. Press any key to exit...[0m

rem Check for key press during the refresh interval
timeout /t 10 >nul
if !errorlevel! NEQ 0 goto supervisor
goto monitor_loop

/*----------------------------------------------------------------------------------------------------------------------------*/

:credits
call :banner

/*----------------------------------------------------------------------------------------------------------------------------*/

:banner
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
call :menu

/*----------------------------------------------------------------------------------------------------------------------------*/

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