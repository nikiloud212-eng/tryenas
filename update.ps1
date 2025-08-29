if (Test-Path D:\1.txt -PathType Leaf) {
	echo "Volume need to update"; echo "Updating....";
        sleep 2; 
        Copy-Item -Path "D:\update\Epic\EpicGamesLauncher" -Destination "C:\ProgramData\Epic" -Recurse -Force -ErrorAction SilentlyContinue;
        Copy-Item -Path "D:\update\EA\InstallData" -Destination "C:\ProgramData\EA Desktop\" -Recurse -Force  -ErrorAction SilentlyContinue;
        Copy-Item -Path "D:\update\riot\Metadata" -Destination "C:\ProgramData\Riot Games\" -Recurse -Force  -ErrorAction SilentlyContinue
        echo "Update successful!"
        del D:\1.txt
	} else {echo "Already Update"}
