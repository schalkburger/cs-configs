:MENU_START
@echo off
cls
set INPUT=false
set "MENU_OPTION="
set "OPTION1_INPUT="
set "OPTION2_INPUT="
echo +===============================================+
echo . BATCH SCRIPT - USER MENU                      .
echo +===============================================+
echo .                                               .
echo .  1) Play                                      .
echo .  2) EXIT                                      .
echo .                                               .
echo +===============================================+
set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %INPUT%==false GOTO DEFAULT

:OPTION1
set INPUT=true
@REM SetScreenResolution 1280 960
@REM start steam://rungameid/730
timeout 2 > NUL
GOTO CSRUNNING

:CSRUNNING
start /WAIT /LOW /MIN cmd
:start
tasklist | find /I "cmd.exe"
if errorlevel 1 (
        SetScreenResolution 1920 1080
        taskkill /f /t /im "csgo.exe"
) else (
        goto start
)

:OPTION2
set INPUT=true
echo Bye
timeout 2 > NUL
exit /b

:DEFAULT
echo Option not available
timeout 2 > NUL
GOTO MENU_START