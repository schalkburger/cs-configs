Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File ""C:\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg\teleport_script_read_log.ps1""", 0, True
