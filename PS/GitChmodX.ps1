Param(
$branchName = 'docker-4',
$GitRootFolder = 'D:\GitHub\ASMalyshev1_microservices'
)

Clear-Host
Set-Location $GitRootFolder

# Переходим в ветку "$branchName"
git checkout $branchName

"& git ls-files --stage"
"======================="
& git ls-files --stage

$Gci = Get-ChildItem -Filter *.sh -Recurse
$Gci.FullName
$Gci|foreach {git update-index --chmod=+x $_.FullName}

'& git ls-files --stage|Select-String -Pattern "^100755"'
"======================="
& git ls-files --stage|Select-String -Pattern "^100755"
"======================="

& git commit -m "made a file executable"
& git push
