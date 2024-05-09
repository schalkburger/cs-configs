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

        # Set width and height of the terminal window
        [System.Console]::SetWindowSize(70, 20)

        # Set the title of the terminal window
        [System.Console]::Title = "CS2 Launcher"

        # Start CSGO
        SetScreenResolution 1280 960
        Start-Sleep 2
        Start-Process steam://launch/730/Dialog
        # Notepad wait
        Start-Process -WindowStyle "Minimized" -Wait notepad
        # Stop CSGO
        Stop-Process -processname "cs2"
        SetScreenResolution 1920 1080
        Start-Sleep 2
        # Close terminal
        Start-Sleep 1
        Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}