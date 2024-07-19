# Wait for the cs2 process to be available
$processName = "cs2"
while ($true) {
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    if ($null -ne $process) {
        $process.PriorityClass = 'High'
        $process.ProcessorAffinity = 0x000000000000001E
        Write-Host "Process priority and affinity set for $processName" -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 1
}