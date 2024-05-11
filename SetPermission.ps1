function Set-Permission{
param(
[string[]]$FilePath,
[string[]]$UserName,
[string[]]$permi,
[int[]]$num
)



$num = Read-Host "`n1 To view the Owner of File/Folder. `n
2 To view Permissions of the File. `n
3 To Grant Specific Permissions to a User. `n
4 To Remove Specific Permissions from a User. `n
5 To copy permission from one folder and give it to another. `n
6 To Change ownership of a File/Folder. `n
0 To Exit. `n"

switch($num) {
1 { 
$FilePath = Read-Host "Enter the file path."
Get-Acl -Path $FilePath
}

2 {
$FilePath = Read-Host "Enter the file path."
(Get-Acl -Path $FilePath).Access | Format-Table *
}

3 {
$FilePath = Read-Host "Enter the file path."
$UserName = Read-Host "Enter the UserName to Grant permission."
$permi = Read-Host "Enter the Modified Permission."

$acl = Get-Acl -Path $FilePath
$accessrule = New-Object System.Security.AccessControl.FileSystemAccessRule($UserName, $permi, "Allow")
$acl.SetAccessRule($accessrule)
$acl | Set-Acl -Path $FilePath
(Get-ACL -Path $FilePath).Access | Format-Table *
}

4 {
$FilePath = Read-Host "Enter the file path."
$UserName = Read-Host "Enter the UserName to Remove permission."
$permi = Read-Host "Enter the Modified Permission."

$acl = Get-Acl -Path $FilePath
$accessrule = New-Object System.Security.AccessControl.FileSystemAccessRule($UserName, $permi, "Allow")
$acl.RemoveAccessRule($accessrule)
$acl | Set-Acl -Path $FilePath
(Get-ACL -Path $FilePath).Access | Format-Table *
}

5 {
$FilePath1 = Read-Host "Enter the file path from where you wanna copy permissions."
$FilePath2 = Read-Host "Enter the file path to whom you wanna give permissions."

​Get-ACL -Path $FilePath1 | Set-ACL -Path $FilePath2
(Get-ACL -Path $FilePath2).Access | Format-Table *

}

6 {
$FilePath = Read-Host "Enter the file path."
$UserName = Read-Host "Enter the New User's Name."

$Acl = Get-Acl -Path $FilePath
$User = New-Object System.Security.Principal.Ntaccount($UserName)
$Acl.SetOwner($User)
$Acl | Set-Acl -Path $FilePath
Get-ACL -Path $FilePath
}

0 { Break }

default {Write-Output "Invalid Input!!!"}


}

}

Set-Permission