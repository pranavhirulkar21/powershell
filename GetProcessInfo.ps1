Write-Output "Process Management"

$num = Read-Host "Select the option.`n
1. Show all the processes. `n
2. Search process by it's name. `n
3. Search process by it's ID. `n
4. Show 10 processes consuming amount most of CPU. `n
5. Show 10 processes having most no. of handles.`n
6. Show 10 processes consuming least amount of CPU. `n
7. Show 10 processes having least no. of handles.`n `n "


switch($num){
1 {
Get-Process
}

2 {
$name = Read-Host "Enter the name of the process "
Get-Process -Name $name
}

3 {
$id = Read-Host "Enter the ID of the process "
Get-Process -Id $id
}

4 {
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
}

5 {
Get-Process | Sort-Object Handles -Descending | Select-Object -First 10
}

6 {
Get-Process | Sort-Object CPU -Descending | Select-Object -Last 10
}

7 {
Get-Process | Sort-Object Handles -Descending | Select-Object -Last 10
}

default { Write-Output "Invalid Option !"}
}