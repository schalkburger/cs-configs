# Ensure that the script runs with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "Restarting script as administrator..."
    Start-Process powershell "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Define the position to place the Command Prompt (negative values for second monitor to the left)
$windowPosX = -1920  # Adjust based on your secondary monitor's width or desired position
$windowPosY = 0

# Run the .bat file with elevated privileges
$batFilePath = "F:\GitHub\cs-configs\misc\aa\aa.bat"  # Update the path to your .bat file
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$batFilePath`"" -Verb RunAs

# Pause to allow the process to start
Start-Sleep -Seconds 2

# Find the Command Prompt window and move it
Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Text;

public class WindowAPI
{
    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool EnumWindows(EnumWindowsProc lpEnumFunc, IntPtr lParam);

    public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);

    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount);
}
"@

$windows = New-Object System.Collections.ArrayList

$sound-null = [WindowAPI+EnumWindowsProc] {
    param([IntPtr]$handle, [IntPtr]$param)

    $sb = New-Object Text.StringBuilder 255
    [WindowAPI]::GetWindowText($handle, $sb, $sb.Capacity) | Out-Null
    $windows.Add($handle)
    return $true
} | Out-Null

[WindowAPI]::EnumWindows($sound-null, [IntPtr]::Zero)

$commandPromptTitle = "Administrator: cmd.exe"  # The window title for Command Prompt
foreach ($handle in $windows) {
    $sb = New-Object Text.StringBuilder 255
    [WindowAPI]::GetWindowText($handle, $sb, $sb.Capacity) | Out-Null
    if ($sb.ToString() -like "*$commandPromptTitle*") {
        # Move the window
        [WindowAPI]::SetWindowPos($handle, [IntPtr]::Zero, $windowPosX, $windowPosY, 0, 0, 5)
        break
    }
}
