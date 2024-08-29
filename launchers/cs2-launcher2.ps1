# ASCII Art of Gabe Newell's Face

# Read and display the ASCII art from the file
Clear-Host
# Get-Content -Path "F:\GitHub\cs-configs\launchers\gaben.txt" | ForEach-Object { Write-Output $_ }
# Write-Output "`n"
Write-Host "     $(Get-Date)"
Write-Output "`n"

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

# 30 = set
# 255 = not set
function GetCS2Affinity {
    $processName = "cs2"
    while ($true) {
        $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($null -ne $process) {
            $affinity = $process.ProcessorAffinity
            Write-Host "Affinity for $processName is $affinity" -ForegroundColor DarkCyan

            if ($affinity -eq 30) {
                Clear-Host
                Write-Host "Affinity for cs2 has been set`n" -ForegroundColor Green
            }
            elseif ($affinity -eq 255) {
                Clear-Host
                Write-Host "Affinity for cs2 has not been set`n" -ForegroundColor Red
            }

            return
        }
    }
}

# Function to set CS2 affinity
function SetCS2Affinity {
    $processName = "cs2"
    while ($true) {
        $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($null -ne $process) {
            $process.PriorityClass = 'High'
            $process.ProcessorAffinity = 0x000000000000001E
            Clear-Host
            Write-Host "Process priority and affinity set for $processName`n" -ForegroundColor DarkCyan
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
    Clear-Host
    Write-Host "`nCounter-Strike 2 has launched.`n" -ForegroundColor Green
    Start-Sleep -Seconds 1
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Start-Process "python" -ArgumentList $pythonScriptPath
    Start-Sleep -Seconds 30
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

# Function to move window
function MoveWindow {
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Clear-Host
    Start-Process "python" -ArgumentList $pythonScriptPath
}

# Function to auto accept
function AutoAccept {
    $aaScriptPath = "F:\GitHub\cs-configs\misc\aa\aa.bat"
    Clear-Host
    Start-Process $aaScriptPath
}

# Function to restore resolution
function RestoreResolution {
    SetScreenResolution 1920 1080
    Clear-Host
    Write-Host "`nResolution restored to 1920x1080.`n" -ForegroundColor DarkCyan
}

# Function to set resolution
function SetResolution {
    SetScreenResolution 1440 1080
    Clear-Host
    Write-Host "`nResolution set to 1440x1080.`n" -ForegroundColor DarkCyan
}

# Function to open lineups folder
function OpenLineups {
    Clear-Host
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

# Function to close CS2
function CloseCS2 {
    $process = Get-Process -Name cs2 -ErrorAction SilentlyContinue
    if ($null -ne $process) {
        Stop-Process -Name cs2 -Force
        Start-Sleep -Seconds 2
        RestoreResolution
        Write-Host "Exiting Counter-Strike 2..." -ForegroundColor White
    }
    else {
        RestoreResolution
        Write-Host "Counter-Strike 2 is not running." -ForegroundColor Yellow
    }
    return
}

# Define menu options
$Opts = @(
    $(New-MenuItem -DisplayName "Launch Counter-Strike 2" -Script { LaunchCS2 }),
    $(Get-MenuSeparator)
    $(New-MenuItem -DisplayName "Get Affinity" -Script { GetCS2Affinity }),
    $(New-MenuItem -DisplayName "Set Affinity" -Script { SetCS2Affinity }),
    $(Get-MenuSeparator)
    $(New-MenuItem -DisplayName "Move Terminal" -Script { MoveWindow }),
    $(New-MenuItem -DisplayName "Restore Resolution" -Script { RestoreResolution }),
    $(New-MenuItem -DisplayName "Set Resolution" -Script { SetResolution }),
    $(New-MenuItem -DisplayName "Open Lineups" -Script { OpenLineups }),
    $(New-MenuItem -DisplayName "Auto Accept" -Script { AutoAccept }),
    $(Get-MenuSeparator)
    $(New-MenuItem -DisplayName "Restart CS2" -Script { RestartCS2 }),
    $(New-MenuItem -DisplayName "Close CS2" -Script { CloseCS2 }),
    $(Get-MenuSeparator)
    $(New-MenuItem -DisplayName "Exit Script" -Script {
            break
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