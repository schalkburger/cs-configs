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
        "  - Take a deep breath                      "
        "  - Check your posture                      "
        "  - Check your corners                      "
        "  - Check your cursor                       "
        ""

        Write-Host "Press any key to play CS...";
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");

        # (new-object -com shell.application).minimizeall()

        clear-host
        # Start CSGO
        SetScreenResolution 1280 960
        Start-Process steam://rungameid/730
        Start-Process -Wait notepad
        # Stop CSGO
        Stop-Process -processname "csgo"
        SetScreenResolution 1920 1080

        Write-Host "Stopped playing CS."

        # timeout /t 1 /nobreak
        Start-Sleep 2
        Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}