@echo off
SetScreenResolution 1440 1080
start steam://rungameid/730
echo.
echo Launching Counter-Strike...
echo.
echo  - Take a deep breath
echo  - Check your posture
echo  - Check your corners
echo  - Check your cursor
echo.
echo Finished (you can now close this window)
pause >nul
echo.
start /WAIT /LOW /MIN notepad
:start
tasklist | find /I "notepad.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "cs2.exe"
) else (
        goto start
)