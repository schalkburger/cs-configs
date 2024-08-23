# ASCII Art of Gabe Newell's Face

Write-Host "⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠉⠉⠉⠋⠉⠉⠙⠛⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⣿⠿⠋⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠉⠻⣿⣿⣿⣿⣿" -ForegroundColor Yellow
Write-Host "⣿⣿⡟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⢻⣿⣿⣿" -ForegroundColor Yellow
Write-Host "⣿⠏⠄⠄⠄⠄⠄⠄⠄⠄⢀⣔⢤⣄⡀⠄⡄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿" -ForegroundColor Yellow
Write-Host "⠏⠄⠄⠄⠄⠄⠄⠄⢀⣀⣨⣵⣿⣿⣿⣿⣧⣦⣤⣀⣿⣷⡐⠄⠄⠄⠄⠄⢿⣿" -ForegroundColor Yellow
Write-Host "⠄⠄⠄⠄⠄⠄⠐⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠄⠄⠄⢚⣿" -ForegroundColor Yellow
Write-Host "⣆⠄⠄⠄⠄⠄⠄⢻⣿⣿⣿⣿⡿⠛⠛⠛⠛⣿⢿⣿⣿⣿⡿⢟⣻⣄⣤⣮⡝⣿" -ForegroundColor Yellow
Write-Host "⣿⠆⠄⠄⠄⠄⠄⠄⠄⠄⠉⠘⣿⡗⡕⣋⢉⣩⣽⣬⣭⣶⣿⣿⣿⣿⣝⣻⣷⣿" -ForegroundColor Yellow
Write-Host "⣿⣦⡀⠄⠄⠠⢀⠄⠄⠁⠄⠄⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⡆⠄⠄⠰⣶⡗⠄⠄⠄⣿⣿⣿⣿⣦⣌⠙⠿⣿⣿⣿⣿⣿⣿⣿⡛⠱⢿" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⣿⡀⠄⠄⠄⠿⣿⠄⠄⠄⠨⡿⠿⠿⣿⣟⣿⣯⣹⣿⣿⣿⣿⣿⣿⣦⡀" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⣿⣷⠄⠄⠄⠄⢷⣦⠄⠄⠐⢶⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⣿⣿⣧⡄⠄⠄⠄⠉⠄⠄⠄⢉⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄" -ForegroundColor Yellow
Write-Host "⣿⣿⣿⣿⣿⠟⠋⠄⠄⠄⠄⠄⠄⠈⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠄⠄" -ForegroundColor Yellow
Write-Host "⣿⠿⠛⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠿⢿⣿⣿⣿⣿⣿⠿⠋⠄⠄⠄⠄" -ForegroundColor Yellow
Write-Host "`n"

# Install PSMenu module if not already installed
if (-not (Get-Module -ListAvailable -Name PSMenu)) {
    Install-Module -Name PSMenu -Force -SkipPublisherCheck
}

# Import PSMenu module
Import-Module PSMenu

# Define the MyMenuOption class
class MyMenuOption {
    [String]$DisplayName
    [ScriptBlock]$Script

    [String]ToString() {
        Return $This.DisplayName
    }
}

# Function to create a new menu item
function New-MenuItem([String]$DisplayName, [ScriptBlock]$Script) {
    $MenuItem = [MyMenuOption]::new()
    $MenuItem.DisplayName = $DisplayName
    $MenuItem.Script = $Script
    Return $MenuItem
}

# Function to set screen resolution
function SetScreenResolution($width, $height) {
    # Placeholder for setting screen resolution
    Write-Host "Setting resolution to $width x $height" -ForegroundColor Yellow
}

# Function to set CS2 affinity
function SetCS2Affinity {
    $processName = "cs2"
    while ($true) {
        $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($null -ne $process) {
            $process.PriorityClass = 'High'
            $process.ProcessorAffinity = 0x000000000000001E
            Write-Host "Process priority and affinity set for $processName" -ForegroundColor DarkCyan
            break
        }
        Start-Sleep -Seconds 1
    }
}

# Function to launch Counter-Strike 2
function LaunchCS2 {
    SetScreenResolution 1440 1080
    $CS2SteamURL = "steam://launch/730"
    Start-Process $CS2SteamURL
    Write-Host "`nCounter-Strike 2 has launched.`n" -ForegroundColor Green
    Start-Sleep -Seconds 1
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Start-Process "python" -ArgumentList $pythonScriptPath
    Start-Sleep -Seconds 30
    SetCS2Affinity
}

# Function to move window
function MoveWindow {
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Start-Process "python" -ArgumentList $pythonScriptPath
}

# Function to auto accept
function AutoAccept {
    $aaScriptPath = "F:\GitHub\cs-configs\misc\aa\aa.bat"
    Start-Process $aaScriptPath
}

# Function to restore resolution
function RestoreResolution {
    SetScreenResolution 1920 1080
    Write-Host "`nResolution restored to 1920x1080.`n" -ForegroundColor Yellow
}

# Function to open lineups folder
function OpenLineups {
    Start-Process "F:\GitHub\cs-configs\lineups"
}

# Function to restart CS2
function RestartCS2 {
    $process = Get-Process -Name cs2 -ErrorAction SilentlyContinue
    if ($null -ne $process) {
        Stop-Process -Name cs2 -Force
        Start-Sleep -Seconds 2
        RestoreResolution
        Write-Host "Exiting Counter-Strike 2..." -ForegroundColor White
    }
    else {
        Write-Host "Counter-Strike 2 is not running." -ForegroundColor Yellow
    }
    Start-Sleep -Seconds 5
    $CS2SteamURL = "steam://launch/730"
    Start-Process $CS2SteamURL
    Write-Host "`nCounter-Strike 2 has restarted.`n" -ForegroundColor Green
}

# Define menu options
$Opts = @(
    $(New-MenuItem -DisplayName "Launch Counter-Strike 2" -Script { LaunchCS2 }),
    $(New-MenuItem -DisplayName "Set Affinity" -Script { SetCS2Affinity }),
    $(New-MenuItem -DisplayName "Move Terminal" -Script { MoveWindow }),
    $(New-MenuItem -DisplayName "Restore Resolution" -Script { RestoreResolution }),
    $(New-MenuItem -DisplayName "Open Lineups" -Script { OpenLineups }),
    $(New-MenuItem -DisplayName "Auto Accept" -Script { AutoAccept }),
    $(New-MenuItem -DisplayName "Restart CS2" -Script { RestartCS2 }),
    $(New-MenuItem -DisplayName "Exit" -Script {
            $process = Get-Process -Name cs2 -ErrorAction SilentlyContinue
            if ($null -ne $process) {
                Stop-Process -Name cs2 -Force
                Start-Sleep -Seconds 2
                RestoreResolution
                Write-Host "Exiting Counter-Strike 2..." -ForegroundColor White
            }
            else {
                Write-Host "Counter-Strike 2 is not running." -ForegroundColor Yellow
            }
            return
        })
)

# Show the interactive menu
while ($true) {
    $Chosen = Show-Menu -MenuItems $Opts -ItemFocusColor Blue
    & $Chosen.Script
    if ($Chosen.DisplayName -eq "Exit") {
        break
    }
}

# End of script