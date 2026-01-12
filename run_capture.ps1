$cwd = 'C:\Users\HP\OneDrive\Desktop\taxi_tera'
Set-Location $cwd
$log = Join-Path $cwd 'flutter_verify.log'
if (Test-Path $log) { Remove-Item $log -Force }
Start-Job -ScriptBlock { Set-Location $using:cwd; & flutter run -d emulator-5554 -v *> $using:log }
Start-Sleep -Seconds 30
Get-Job | Stop-Job -Force
Get-Content -Path $log -Tail 300 -Encoding utf8
