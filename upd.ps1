do {
Test-Connection 192.168.88.253 -Count 3 -ErrorAction SilentlyContinue | Out-Null
} until ($? -eq $True)
powershell -exec Bypass C:\TrueNas\update.ps1
