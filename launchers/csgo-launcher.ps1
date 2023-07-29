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
        Write-Host "Press any key to play CS...";
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
        clear-host
        # Start CSGO
        SetScreenResolution 1280 960
        Start-Process steam://rungameid/730
        Write-Host "`n";
        # Write-Host "1. Check your posture";
        # Write-Host "2. Remember your crosshair placement";
        # Write-Host "3. Communicate with your team";
        # Write-Host "4. Use utility effectively";
        # Write-Host "`n";
        # Notepad wait
        Start-Process -WindowStyle "Minimized" -Wait notepad
        # Stop CSGO
        Stop-Process -processname "csgo"
        SetScreenResolution 1920 1080
        Write-Host "Stopped playing CS."
        # Close terminal
        Start-Sleep 1
        Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}