#.gitignore
(Select-String -Path .\.gitignore -Pattern "Docker.exe" -NotMatch).Line|Out-File -FilePath .\.gitignore -Encoding utf8 -Force
"Docker.exe"|Out-File -FilePath .\.gitignore -Encoding utf8 -Force -Append

    IF (!(Get-Service|Where-Object {$_.Name -match "docker"})){

        Invoke-WebRequest -Uri https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe -OutFile .\Docker.exe
        Start-Process .\Docker.exe -Wait
        docker --version

    } ELSE {

        "Docker already installed"

    }

    #Remove .\Docker.exe
    IF (Test-Path -Path .\Docker.exe){
        
        Remove-Item -Path .\Docker.exe -Force

    }
