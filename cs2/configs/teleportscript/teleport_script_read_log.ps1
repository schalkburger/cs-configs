# PATH FOR THE CONSOLE.LOG FILE
$logFile = "F:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\console.log"

# PATH FOR THE CFG FILE THAT WILL RECEIVE THE SETPOS OUTPUT
$outFile = "F:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg\configs\teleportscript\teleport_script_setpos.cfg"

# READ THE CONSOLE.LOG FILE AND GET THE LAST LINE THAT CONTAINS "setpos"
$lastSetPosLine = Get-Content $logFile | Select-String "setpos" | Select-Object -Last 1

# REMOVE DATE AND TIME FROM THE "setpos" line
$lastSetPosLine = $lastSetPosLine -replace '^\d{2}/\d{2} \d{2}:\d{2}:\d{2} ', ''

# CREATES THE CFG FILE (OR REPLACE IF IT ALREADY EXISTS) AND WRITE THE VALUE IN IT
$lastSetPosLine | Set-Content $outFile
