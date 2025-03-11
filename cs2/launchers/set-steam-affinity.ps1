# Script to set affinity for Steam process
$processName = "steam"

# Check if Steam is running
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

if ($null -ne $process) {
    try {
        # Set affinity to 1FFE (but ensure it's compatible with your system)
        $affinityValue = 0x1FFE
        $process.ProcessorAffinity = $affinityValue
        Write-Host "Process affinity set for $processName to 0x1FFE" -ForegroundColor Green
    }
    catch {
        Write-Host "Error setting affinity: $_" -ForegroundColor Red

        # Get system processor count
        $processorCount = [Environment]::ProcessorCount
        Write-Host "Your system has $processorCount logical processors." -ForegroundColor Yellow

        # Calculate maximum possible affinity value (2^processorCount - 1)
        $maxAffinity = [math]::Pow(2, $processorCount) - 1
        Write-Host "Maximum possible affinity value: 0x$($maxAffinity.ToString('X'))" -ForegroundColor Yellow

        # Suggest a compatible value (use all available processors)
        Write-Host "Try using a compatible value like: 0x$($maxAffinity.ToString('X'))" -ForegroundColor Yellow
    }
} else {
    Write-Host "Steam is not currently running. Please start Steam first." -ForegroundColor Red
}
