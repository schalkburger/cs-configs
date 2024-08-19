# Function to set affinity for Counter-Strike 2
function SetCS2Affinity {
    # Path to your cs2-set-affinity.ps1 script
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
    # Define the Steam game launch URL for Counter-Strike 2
    SetScreenResolution 1440 1080
    $CS2SteamURL = "steam://launch/730"
    Start-Process $CS2SteamURL
    Write-Host "`nCounter-Strike 2 has launched.`n" -ForegroundColor Green
    Start-Sleep -Seconds 5
    # Move the Counter-Strike 2 window to the second monitor using Python
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Start-Process "python" -ArgumentList $pythonScriptPath
    Start-Sleep -Seconds 30

    # Wait for the cs2 process to be available and set priority and affinity
    $processName = "cs2"
    while ($true) {
        $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
        if ($null -ne $process) {
            $process.PriorityClass = 'High'
            $process.ProcessorAffinity = 0x000000000000001E
            Write-Host "Process priority and affinity set for $processName`n" -ForegroundColor DarkCyan
            break
        }
        Start-Sleep -Seconds 1
    }
}

# Function to restore native resolution
function MoveWindow {
    # Move the Counter-Strike 2 window to the second monitor using Python
    $pythonScriptPath = "F:\GitHub\cs-configs\launchers\cs2-movewindow.py"
    Start-Process "python" -ArgumentList $pythonScriptPath
}

function AutoAccept {
    # Move the Counter-Strike 2 window to the second monitor using Python
    $aaScriptPath = "F:\GitHub\cs-configs\misc\aa\aa.bat"
    Start-Process $aaScriptPath
}

# Function to restore native resolution
function RestoreResolution {
    SetScreenResolution 1920 1080
    Write-Host "`nResolution restored to 1920x1080.`n" -ForegroundColor Yellow
}

# Function to open lineups folder
function OpenLineups {
    Start-Process "F:\GitHub\cs-configs\lineups"
}

# Restart CS2
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

# Function to display the menu and handle user input
function ShowMenu {
    Write-Host "CS2 Launcher`n" -ForegroundColor Blue
    Write-Host "1. Launch Counter-Strike 2" -ForegroundColor Cyan
    Write-Host "2. Set Affinity" -ForegroundColor Cyan
    Write-Host "3. Move Terminal" -ForegroundColor Cyan
    Write-Host "4. Restore Resolution" -ForegroundColor Cyan
    Write-Host "5. Open Lineups" -ForegroundColor Cyan
    Write-Host "6. Auto Accept" -ForegroundColor Cyan
    Write-Host "7. Restart CS2" -ForegroundColor Cyan
    Write-Host "8. Exit`n" -ForegroundColor Cyan

    while ($true) {
        $choice = Read-Host "Enter your choice"

        switch ($choice) {
            '1' {
                LaunchCS2
                break
            }
            '2' {
                SetCS2Affinity
                break
            }
            '3' {
                MoveWindow
                break
            }
            '4' {
                RestoreResolution
                break
            }
            '5' {
                OpenLineups
                break
            }
            '6' {
                AutoAccept
                break
            }
            '7' {
                RestartCS2
                break
            }
            '8' {
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
            }
            default {
                Write-Host "Invalid choice." -ForegroundColor Red
            }
        }
    }
}

# Show the interactive menu
ShowMenu

# End of script