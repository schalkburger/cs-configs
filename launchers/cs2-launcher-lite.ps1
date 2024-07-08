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

Start-Sleep -Seconds 2

# Define the Steam game launch URL for Counter-Strike 2
$CS2SteamURL = "steam://launch/730/Dialog"

# Start Counter-Strike 2
Start-Process $CS2SteamURL

Write-Host "Counter-Strike 2 has launched `n" -ForegroundColor Green
