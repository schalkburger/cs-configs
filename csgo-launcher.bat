@echo off
SetScreenResolution 1280 960
start steam://rungameid/730
echo Lauching Counter-Strike...
start "" /WAIT /LOW "C:\Program Files\IrfanView\i_view64.exe"
:start
tasklist | find /I "i_view64.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "csgo.exe"
) else (
        goto start
)