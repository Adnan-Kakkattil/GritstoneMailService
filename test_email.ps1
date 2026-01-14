$smtpServer = "localhost"
$smtpPort = 2525
$from = "test@example.com"
$to = "adnan@nomadscipher.com"
$subject = "Test Email from PowerShell"
$body = "Hello! This is a test email to verify the Gritstone Mail Service."

Write-Host "Sending test email to ${smtpServer}:${smtpPort}..."

try {
    Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -ErrorAction Stop
    Write-Host "Success: Email sent!" -ForegroundColor Green
} catch {
    Write-Host "Failed to send email: $($_.Exception.Message)" -ForegroundColor Red
}
