# Define the executable for changing resolution
$SetResolutionCmd = "SetScreenResolution"

# Function to change resolution
function Set-Resolution {
    param (
        [string]$resolution
    )
    & $SetResolutionCmd $resolution
}

Write-Host "Launcher starting... `n" -ForegroundColor Cyan

Start-Sleep -Seconds 1

# Change to target resolution
SetScreenResolution 1440 1080

Start-Sleep -Seconds 3

# Define the Steam game launch URL for Counter-Strike 2
$CS2SteamURL = "steam://launch/730/Dialog"

# Start Counter-Strike 2
Start-Process $CS2SteamURL

Write-Host "Counter-Strike 2 has launched `n" -ForegroundColor Green

# Wait for specific key press (Enter key)
Write-Host "Press the 'Enter' key when you are done playing Counter-Strike 2..." -ForegroundColor White
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

Write-Host "`n Resolution restored to 1920x1080.`n" -ForegroundColor Yellow
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