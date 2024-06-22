# Define the executable for changing resolution
$SetResolutionCmd = "SetScreenResolution"

# Define resolutions
$targetResolutionX = "1440"
$targetResolutionY = "1080"

$nativeResolutionX = "1920"
$nativeResolutionY = "1080"

# Function to change resolution
function Set-Resolution {
        param (
                [string]$resolution
        )
        & $SetResolutionCmd $resolution1 $resolution2
}

# Change to target resolution
SetScreenResolution $targetResolutionX $targetResolutionY

# Define the Steam game launch URL for Counter-Strike 2
$CS2SteamURL = "steam://launch/730/Dialog"

# Start Counter-Strike 2
Start-Process $CS2SteamURL

# Wait for the game process to close
Write-Host "Waiting for Counter-Strike 2 to close..."
while (Get-Process -Name "cs2" -ErrorAction SilentlyContinue) {
        Start-Sleep -Seconds 5
}

# Change back to the native resolution
SetScreenResolution $nativeResolutionX $nativeResolutionY

Write-Host "Resolution restored to $nativeResolutionX $nativeResolutionY."
