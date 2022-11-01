@echo off
SetScreenResolution 1280 960
start steam://rungameid/730
echo Lauching Counter-Strike...
start /WAIT /LOW notepad
:start
tasklist | find /I "notepad.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "csgo.exe"
) else (
        goto start
)