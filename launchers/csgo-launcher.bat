@echo off
SetScreenResolution 1280 960
start "" "E:\Portable Apps\Shortcuts\Headphones.lnk"
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
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Anti-eco        ^| Know enemy team is going eco, buy weapons specialized for making money (smgs, shotguns). ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Dry-peek        ^| a situation when a player aggresses another without the use of a flash                   ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Eco             ^| a round that involves a team collectively saving their money                             ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Force           ^| team buys weapons even when their money is low because a round win is essential          ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Half-buy        ^| When half the team buys rifles and the other half purchases cheaper items to save money  ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Lurk            ^| a player whose role is to silently traverse the map to catch the enemy team off guard    ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Picks           ^| play passive, safe, and loose, while also trying to kill the enemy team                  ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Save            ^| a round where a team must not spend any money whatsoever                                 ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Shoulder peek   ^| You don't see the opponent but the opponent can see your 'shoulder' so you bait a shot.  ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
@REM echo   ^| Swing/Wide peek ^| strafe out the wall wide and start shooting.                                             ^|
@REM echo   +-----------------+------------------------------------------------------------------------------------------+
echo.
start /WAIT /LOW /MIN notepad
:start
tasklist | find /I "notepad.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "csgo.exe"
) else (
        goto start
)