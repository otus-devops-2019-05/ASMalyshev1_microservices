# 15.  Docker контейнеры. Docker под капотом

Clear-Host
Set-Location $PSScriptRoot
#return

<#
Создайте новую ветку в вашем microservices репозитории в организации DevOps 2019-05 для выполнения данного ДЗ. 
Ветку назовите docker-2.
#>

$Location = (Get-Location).Path
$GitRootFolder = 'D:\GitHub\ASMalyshev1_microservices'

# Создаем новую ветку в нашем инфраструктурном репозитории для выполнения данного ДЗ.
$branchName = 'docker-2'

# Создаем новую ветку "$branchName"
git branch $branchName

# Переходим в ветку "$branchName"
git checkout $branchName

<#
В репозитории должна быть настроена интеграция с travis-ci по аналогии с репозиторием infra.
#>

$travisYml = '.travis.yml'

@"
dist: trusty
sudo: required
language: bash
before_install:
- curl https://raw.githubusercontent.com/express42/otus-homeworks/2019-05/run.sh |
  bash
notifications:
  slack:
    rooms:
      secure: CoU5+bXQuGHW/W3YHovrly5/Ix1j176ee+RZTbiylDBKEJLhwJVYNr0/spMDXZmrX4D18jKDHZTUucNWYsh/Wf+ZziS4z0rNcuV72LXh4X+FWwN4X8Z+70C3ZpPnfKvXBNtXk1w6syjPLa02TFalJuv2GSJ0UbXPmT9sqyNtUudnIO9BcbIiVnNIzf2fc73ZcZJsgISJ3dKyvuY7rgNi0s/smDFyHLZrMbrfaYR9IZOr2qsxJ5hK0gXI+LM3TZNbjy5THvdaSpoe8Ke2f/e72Bf3YCcK2GpRDVJYUvM4VuL/UwTDh4WUp9KAdUsvNATZZyID8hH0L9gUfPFg59d4yjoRPvFYUG4+RcCDR3UaAa0ndwkIfncuOsc6+8KU/yhaJ3A4CgbAXQNGccixWgap6D4arX8xFqS1WDgQob6YQnkQFbyDkVHyFRAeJiDikMT0b0YT4Gk5bRdRu6I30WR23SyO3+6Q3ktK8KYG75/0iV5vKiS4JsOhO1UZ953iULXEefOuRzR5PGl81PCjEl8Re04moLcA1t/rio48n96dW0ZTUvI9aMQn6sxiIz066QFo9pM8PSMOYNehhseDsxQRyzfQ+HauM7Tzt8BPNubar+x66rd7ZGKHUqcTsc0gCIxC5SiCqwj/xEsdIHL9StNKb5gpfR1VbII7NPPqB7nb150=
  
"@.split(13)|Out-File -FilePath $GitRootFolder\$travisYml -Encoding utf8 -Force

# В новой ветке создайте директорию docker-monolith
$dockerMonolith = 'docker-monolith'
IF(!(Test-Path -Path $GitRootFolder\$dockerMonolith)){
New-Item -Path $GitRootFolder -Name $dockerMonolith -ItemType Directory -Force
}

# Устанавливаем Docker
& .\DockerInstall.ps1
& docker version
# Запустим первый контейнер
docker run hello-world

# Список запущенных контейнеров
docker ps
# Список всех контейнеров
docker ps -a
#Список сохранненных образов
docker images

docker run -it ubuntu:16.04 /bin/bash
docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Names}}"

#Для сдачи домашнего задания, необходимо сохранить вывод команды docker images в файл docker-monolith/docker-1.log и закоммитить в репозиторий
docker images|Out-File $GitRootFolder\$dockerMonolith\docker-1.log -Encoding utf8 -Force
git add $GitRootFolder\$dockerMonolith\docker-1.log
git commit -m «docker-1.log»
git push

docker ps -q
docker kill $(docker ps -q)

docker system df
docker rm $(docker ps -a -q) # удалит все не запущенные контейнеры
docker rmi $(docker images -q)

# https://github.com/docker/for-win/issues/688
docker ps -a -q | % { docker stop $_ }
docker ps -a -q | % { docker rm $_ }
docker images --filter "dangling=true" -q --no-trunc | % { docker rmi $_ -f }
docker volume ls -qf dangling=true | % { docker volume rm $_ }

#gcloud init
docker-machine -v
gcloud  export=infra-244306
return
#Поднимите инфраструктуру, описанную в окружении stage
Set-Location $GitRootFolder\terraform\stage
<#
terraform destroy -auto-approve=true
#>
<#
terraform init
terraform plan
terraform apply -auto-approve=true
#>