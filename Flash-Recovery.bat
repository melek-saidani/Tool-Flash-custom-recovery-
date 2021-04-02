@echo off
TITLE          Tool Flash Custom Recovery
color 22
Mode con: COLS=75 LINES=40
echo.
echo     ******* ***********                    ****** ********
echo     ****   1: Please enable USB debugging mode     ****
echo     ******************************************************

echo.             
echo.
taskkill /f /im "adb.exe" >nul 2>nul
cd /d %~dp0adb
adb kill-server
adb start-server
echo.
echo   *******  Wait for the device
adb devices
echo.
pause
echo.

echo     ******************************************************
echo     ****   fastboot mode                              ****
echo     ******************************************************

adb reboot bootloader
echo.             
echo     ******************************************************
echo     ****    TY                                         ****
echo     ******************************************************
pause
echo.
echo   ****  Flashing Recovery
fastboot erase recovery
fastboot flash recovery recovery.img
echo.
echo   ****  continue....
choice /t 5 /d y /n>nul
echo   ****  Run recovery...
echo   ****  Wait until it is downloaded, please be patient...
fastboot boot recovery.img           
echo.
echo.
echo   *******  Who will restart at the set Recovery...
choice /t 25 /d y /n>nul             
echo.
echo   *******  Reboot in recovery
adb reboot recovery
echo.             
echo   *******  SUCCESS!
echo.                         
ECHO.  Press any key to exit ...
pause  >NUL
EXIT

