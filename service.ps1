do {
Test-Connection 192.168.88.253 -Count 1 -ErrorAction SilentlyContinue | Out-Null
} until ($? -eq $True)
net start MSiSCSI
sleep 2
powershell -exec Bypass C:\TrueNas\update.ps1
