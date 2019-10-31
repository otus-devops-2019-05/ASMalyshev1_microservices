﻿# 19. Устройство Gitlab CI. Построение процесса непрерывной интеграции

Clear-Host
Set-Location $PSScriptRoot
#return

$Location = (Get-Location).Path
$GitRootFolder = 'D:\GitHub\ASMalyshev1_infra'

# Создаем новую ветку в нашем инфраструктурном репозитории для выполнения данного ДЗ.
$branchName = 'gitlab-ci-1'

# Создаем новую ветку "$branchName"
git branch $branchName

# Переходим в ветку "$branchName"
git checkout $branchName

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