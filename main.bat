@echo off
title Utility - By Blanco
chcp 65001 >nul
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
echo       ╠ (4) Credits
set /p input=.%BS%      ╚ 
if /I %input% LSS 1 call :menu
if /I %input% EQU 1 call :script
if /I %input% EQU 2 call :tools
if /I %input% EQU 3 call :commands
if /I %input% EQU 4 call :credits
if /I %input% GTR 4 call :menu

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
echo       ╠ (4) DiskDrive.ps1 (WIP)
echo       ╠ (5) Song.ps1 (Do not execute in a busy space)
set /p input=.%BS%      ╚ 
if /I %input% EQU exit call :menu
if /I %input% LSS 1 call :script
if /I %input% EQU 1 start IP.ps1
if /I %input% EQU 2 start Réseau.ps1
if /I %input% EQU 3 start Latency.ps1 
fi /I %input% EQU 4 start DiskDrive.ps1
if /I %input% EQU 5 start song.ps1 
if /I %input% GTR 5 call :script
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
echo       ╠ (9) Restart the Computer
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



if /I %input% EQU 9 ( cls
shutdown /r /t 0 /f)
if /I %input% EQU 10 ( cls
shutdown /r /fw /t 0 /f)
if /I %input% GTR 10 call :commands
call :menu

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