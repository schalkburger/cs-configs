<#
.SYNOPSIS
    Launches Counter-Strike 2 through Windows Terminal
.DESCRIPTION
    This script launches the Windows Terminal, starts Counter-Strike 2, waits for Notepad to close,
    and then stops Counter-Strike 2 and closes the terminal window.
.EXAMPLE
    PS> ./cs2-launcher.ps1
.LINK
    https://github.com/schalkburger
.NOTES
    Author: Schalk Burger | License: CC0
#>

try {
    # Load the necessary Win32 API functions
    Add-Type @"
        using System;
        using System.Runtime.InteropServices;
        public class Win32 {
            [DllImport("user32.dll")]
            [return: MarshalAs(UnmanagedType.Bool)]
            public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
        }
"@

    # Get the first Windows Terminal process
    $terminalProcess = Get-Process -Name WindowsTerminal | Select-Object -First 1
    if (-not $terminalProcess) {
        throw "Windows Terminal process not found."
    }

    $terminalWindowHandle = $terminalProcess.MainWindowHandle

    Clear-Host
    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    # Minimize the terminal window
    [void][Win32]::ShowWindow($terminalWindowHandle, 6) # 6 represents SW_MINIMIZE

    # Set the title of the terminal window
    [System.Console]::Title = "CS2 Launcher"

    # Start Counter-Strike 2
    & SetScreenResolution 1280 960
    Start-Sleep -Seconds 2
    Start-Process "steam://launch/730/Dialog"
    # Notepad wait
    Start-Process -FilePath "notepad" -WindowStyle Minimized -Wait
    # Stop Counter-Strike 2
    Stop-Process -Name "cs2"
    & SetScreenResolution 1920 1080
    Start-Sleep -Seconds 2
    # Close terminal
    Start-Sleep -Seconds 1
    Stop-Process -Name "WindowsTerminal"

    return 0 # success
}
catch {
    Write-Host "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    return 1
}
