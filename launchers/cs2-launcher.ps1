Write-Host "Launcher starting... `n" -ForegroundColor Cyan

Start-Sleep -Seconds 1

# Change to target resolution
SetScreenResolution 1440 1080

Start-Sleep -Seconds 1

# Define the Steam game launch URL for Counter-Strike 2
$CS2SteamURL = "steam://launch/730"

# Start Counter-Strike 2
Start-Process $CS2SteamURL

Write-Host "`nCounter-Strike 2 has launched `n" -ForegroundColor Green

# Wait a bit to ensure the game has fully launched
# Start-Sleep -Seconds 60

# Wait for the cs2 process to be available and set priority and affinity
# $processName = "cs2"
# while ($true) {
#     $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
#     if ($null -ne $process) {
#         $process.PriorityClass = 'High'
#         $process.ProcessorAffinity = 0x000000000000001E
#         Write-Host "Process priority and affinity set for $processName" -ForegroundColor DarkCyan
#         break
#     }
#     Start-Sleep -Seconds 1
# }

# Move the Counter-Strike 2 window to the second monitor using Python
# $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
# Start-Process "python" -ArgumentList $pythonScriptPath

# Wait for specific key press (Enter key)
Write-Host "`nPress the 'Enter' key when you are done playing Counter-Strike 2..." -ForegroundColor White
while ($true) {
    $keyInfo = [System.Console]::ReadKey($true)
    if ($keyInfo.Key -eq [System.ConsoleKey]::Enter) {
        break
    }
    else {
        Write-Host "Incorrect key. Please press 'Enter' to continue." -ForegroundColor Red
    }
}

# Change back to the native resolution
SetScreenResolution 1920 1080

Start-Sleep -Seconds 3

Write-Host "`nResolution restored to 1920x1080.`n" -ForegroundColor Yellow
Write-Host "Press the 'Enter' key to exit..." -ForegroundColor White
while ($true) {
    $keyInfo = [System.Console]::ReadKey($true)
    if ($keyInfo.Key -eq [System.ConsoleKey]::Enter) {
        break
    }
    else {
        Write-Host "Incorrect key. Please press 'Enter' to exit." -ForegroundColor Red
    }
}
