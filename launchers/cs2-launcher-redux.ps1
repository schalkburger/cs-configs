# Define the executable for changing resolution
$SetResolutionCmd = "SetScreenResolution"

# Function to change resolution
function Set-Resolution {
        param (
                [string]$resolution
        )
        & $SetResolutionCmd $resolution1 $resolution2
}

# Change to target resolution
SetScreenResolution 1440 1080

# Define the Steam game launch URL for Counter-Strike 2
$CS2SteamURL = "steam://launch/730/Dialog"

# Start Counter-Strike 2
Start-Process $CS2SteamURL

Start-Sleep -Seconds 5

# Check for the game process
$gameProcess = Get-Process -Name "cs2" -ErrorAction SilentlyContinue

if ($null -eq $gameProcess) {
        Write-Host "Unable to detect the game process. Please ensure 'cs2' is the correct process name."
        exit
}

Write-Host "Waiting for Counter-Strike 2 to close..."

# Loop to check if the game process is still running
while ($gameProcess) {
        Start-Sleep -Seconds 5
        $gameProcess = Get-Process -Name "cs2" -ErrorAction SilentlyContinue
}

# Change back to the native resolution
SetScreenResolution 1920 1080

Write-Host "Resolution restored to 1920x1080."
Write-Host "Press any key to exit..."
[void][System.Console]::ReadKey($true)  # Keeps the window open until a key is pressed