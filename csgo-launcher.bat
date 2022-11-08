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
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Anti-eco        ^| Know enemy team is going eco, buy weapons specialized for making money (smgs, shotguns). ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Dry-peek        ^| a situation when a player aggresses another without the use of a flash                   ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Eco             ^| a round that involves a team collectively saving their money                             ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Force           ^| team buys weapons even when their money is low because a round win is essential          ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Half-buy        ^| When half the team buys rifles and the other half purchases cheaper items to save money  ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Lurk            ^| a player whose role is to silently traverse the map to catch the enemy team off guard    ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Picks           ^| play passive, safe, and loose, while also trying to kill the enemy team                  ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Save            ^| a round where a team must not spend any money whatsoever                                 ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Shoulder peek   ^| You don't see the opponent but the opponent can see your 'shoulder' so you bait a shot.  ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo   ^| Swing/Wide peek ^| strafe out the wall wide and start shooting.                                             ^|
echo   +-----------------+------------------------------------------------------------------------------------------+
echo.
start /WAIT /LOW notepad
:start
tasklist | find /I "notepad.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "csgo.exe"
) else (
        goto start
)