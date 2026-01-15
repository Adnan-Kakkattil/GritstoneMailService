$vpsIp = "20.244.18.216"
$ports = @(25, 80, 443, 8080, 2525, 5432)

Write-Host "--- Checking Ports on $vpsIp ---" -ForegroundColor Cyan

foreach ($port in $ports) {
    try {
        $connection = New-Object System.Net.Sockets.TcpClient
        $asyncResult = $connection.BeginConnect($vpsIp, $port, $null, $null)
        $wait = $asyncResult.AsyncWaitHandle.WaitOne(2000, $false) # 2 second timeout
        
        if ($wait) {
            $connection.EndConnect($asyncResult)
            Write-Host "Port $port : OPEN" -ForegroundColor Green
        } else {
            Write-Host "Port $port : CLOSED / TIMEOUT" -ForegroundColor Red
        }
        $connection.Close()
    } catch {
        Write-Host "Port $port : ERROR ($($_.Exception.Message))" -ForegroundColor Yellow
    }
}

Write-Host "`n--- Checking Web Dashboard ---" -ForegroundColor Cyan
try {
    $web = Invoke-WebRequest -Uri "http://$vpsIp:8080" -Method Get -TimeoutSec 5
    Write-Host "Web Interface (8080): OK (Status $($web.StatusCode))" -ForegroundColor Green
} catch {
    Write-Host "Web Interface (8080): FAILED ($($_.Exception.Message))" -ForegroundColor Red
}
