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

do {
        Write-Host "`n                                                      "
        Write-Host "`n                                                      "
        Write-Host "`t1. Start playing CS:GO                         "
        Write-Host "`t2. Quit                                        "
        Write-Host "                                                        "
        $choice = Read-Host "`nEnter Choice"
        } until (($choice -eq '1') -or ($choice -eq '2') )
        switch ($choice) {
           '1'{
               Write-Host "`nYou have selected a Prod Environment"
           }
            '2'{
              Return
           }
        }

try {
        clear-host
        "                                            "
        "
         ____ ____    ____  ___
        / ___/ ___|_ / ___|/ _ \
       | |   \___ (_) |  _| | | |
       | |___ ___) || |_| | |_| |
        \____|____(_)\____|\___/
                                                     "
        "                                            "
        "       - Take a deep breath                      "
        "       - Check your posture                      "
        "       - Check your corners                      "
        "       - Check your cursor                       "
        "                                            "
        Start-Process notepad

        do {
                Write-Host "`n                                                      "
                Write-Host "`t1. Stop playing CS:GO                         "
                Write-Host "                                                        "
                $choice = Read-Host "`nEnter Choice"
                } until (($choice -eq '1'))
                switch ($choice) {
                    '1'{
                      Return
                   }
                }

        # Write-Host "      Press any key to launch CS...";
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");

        # (new-object -com shell.application).minimizeall()

        # clear-host
        # Start CSGO
        # SetScreenResolution 1280 960
        # Start-Process steam://rungameid/730
        Start-Process notepad
        # Stop CSGO
        Stop-Process -processname "csgo"
        SetScreenResolution 1920 1080

        Write-Host "Stopped playing CS."

        # timeout /t 1 /nobreak
        # Start-Sleep 2
        # Stop-Process -processname "conhost"

        exit 0 # success
}
catch {
        "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
        exit 1
}