<#
.SYNOPSIS
	Launches the Windows Terminal app
.DESCRIPTION
	This script launches the Windows Terminal application.
.EXAMPLE
	PS> ./open-windows-terminal
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
        clear-host
        ""
        Write-Host "Press any key to derank...";
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
        clear-host
        # Start CSGO
        SetScreenResolution 1280 960
        Start-Process steam://launch/730/Dialog
        MultiMonitorTool /LoadConfig "E:\GitHub\cs-configs\launchers\monitors-cs2-1280x960.cfg"
        Write-Host "`n";
        # Notepad wait
        # Start-Process -WindowStyle "Minimized" -Wait notepad
        Start-Process -WindowStyle "Minimized" -Wait "C:\Program Files\WindowsApps\Microsoft.WindowsAlarms_11.2309.5.0_x64__8wekyb3d8bbwe\Time.exe"
        # Stop CSGO
        Stop-Process -processname "cs2"
        SetScreenResolution 1920 1080
        Write-Host "Stopped playing CS2."
        # Close terminal
        Start-Sleep 1
        # Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}