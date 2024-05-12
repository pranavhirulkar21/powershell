Write-Output "`nUser Management Info."

$num = Read-Host "
1. View all users present in the system.`n
2. View all groups present in the system.`n
3. Add a new user in the system.`n
4. Change the passsword of an existing user.`n
5. Rename the username of an existing user.`n
6. Delete a user from the system. `n
7. Add a new group in the system.`n
8. Add a user to a existing group.`n"


switch($num){
1 {
Get-LocalUser
}

2 {
Get-LocalGroup
}

3 {
$username = Read-Host "Enter the new Username"
Write-Output "Enter the Password"
$password = Read-Host -AsSecureString
$description = Read-Host "Enter some description for the new User"
New-LocalUser -Name $username -Password $password -Description $description
}

4 {
$username = Read-Host "Enter the Username whose password you want to Change"
Write-Output "Enter the new Password"
$newPassword = Read-Host -AsSecureString
Set-LocalUser -Name $username -Password $newPassword

}

5 {
$username = Read-Host "Enter the username you want to Rename"
$newUsername = Read-Host "Enter the New Username"
Rename-LocalUser -Name $username -NewName $newUsername
}

6 {
$username = Read-Host "Enter the username you want to Remove/Delete"
Remove-LocalUser -Name $username
}

7 {
$groupname = Read-Host "Enter the new Group's name"
New-LocalGroup -Name $groupname
}

8 {
$groupname = Read-Host "Enter the Group name"
$username = Read-Host "Enter the Username"
Add-LocalGroupMember -Group $groupname -Member $username
}

default { Write-Output "Invalid Input!"}
}
