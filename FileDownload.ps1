
 $link = Read-Host "Type the link of source content"
 $filepath = Read-Host "Type the address to store file there!!!"

 Invoke-WebRequest -Uri $link -OutFile $filepath
