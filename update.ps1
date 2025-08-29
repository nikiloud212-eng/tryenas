do {
Test-Connection 192.168.88.253 -Count 3 -ErrorAction SilentlyContinue | Out-Null
} until ($? -eq $True)
Get-ChildItem -Path D:\update\ -Include * | remove-Item -recurse
Copy-Item -Path "C:\ProgramData\EA Desktop\InstallData" -Destination "D:\update\EA\InstallData" -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item -Path "C:\ProgramData\Epic\EpicGamesLauncher" -Destination "D:\update\Epic\EpicGamesLauncher" -Recurse -Force -Exclude "*.msi", "*.exe" -ErrorAction SilentlyContinue
Copy-Item "C:\ProgramData\Riot Games\Metadata" -Destination "D:\update\riot\Metadata" -Recurse -Force -ErrorAction SilentlyContinue
