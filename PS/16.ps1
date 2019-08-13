# 16. Docker образы. Микросервисы

Clear-Host
Set-Location $PSScriptRoot
#return

<#
Создайте новую ветку в вашем microservices репозитории в организации DevOps 2019-05 для выполнения данного ДЗ. 
Ветку назовите docker-3.
#>

$Location = (Get-Location).Path
$GitRootFolder = 'D:\GitHub\ASMalyshev1_microservices'

# Создаем новую ветку в нашем инфраструктурном репозитории для выполнения данного ДЗ.
$branchName = 'docker-3'

# Создаем новую ветку "$branchName"
git branch $branchName

# Переходим в ветку "$branchName"
git checkout $branchName

# Переходим в папку с DockerFile
Set-Location $GitRootFolder\docker-monolith\
# Выполняем сборку контейнера
docker build -t reddit:latest .
# Запускаем контейнер
docker run --name reddit -d --network=host reddit:latest
