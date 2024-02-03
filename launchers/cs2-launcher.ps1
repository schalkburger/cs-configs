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
        # Write-Host "Press any key to derank...";
        # $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
        # Start CSGO
        SetScreenResolution 1280 960
        Start-Sleep 2
        Start-Process steam://launch/730/Dialog
        New-BurntToastNotification -AppLogo "E:\Apps\Windows Apps\Custom Icons\cs2.png" -Text "Launching Counter-Strike 2...", '1. Take a deep breath
        2. Check your posture
        3. Check your corners
        4. Check your cursor placement'
        # MultiMonitorTool /LoadConfig "E:\GitHub\cs-configs\launchers\monitors-cs2-1280x960.cfg"
        Write-Host "`n";
        # Notepad wait
        Start-Process -WindowStyle "Minimized" -Wait notepad
        # Start-Process -WindowStyle "Minimized" -Wait "C:\Program Files\WindowsApps\Microsoft.WindowsAlarms_11.2309.5.0_x64__8wekyb3d8bbwe\Time.exe"
        # Stop CSGO
        Stop-Process -processname "cs2"
        SetScreenResolution 1920 1080
        Start-Sleep 2
        MultiMonitorTool /LoadConfig "E:\Apps\Windows Apps\MultiMonitorTool\monitors-default.cfg"
        New-BurntToastNotification -AppLogo "E:\Apps\Windows Apps\Custom Icons\cs2.png" -Text "Stopped playing CS2.",
        'Counter-Strike 2'
        # Close terminal
        Start-Sleep 1
        # Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}