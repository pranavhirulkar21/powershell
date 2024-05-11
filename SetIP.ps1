do {
Write-Output "System's IP configuration : `n `n"
Get-NetIPConfiguration

$newIP = Read-Host "Enter a new IP address"

$ipAvailable = Test-Connection -ComputerName $newIP -Count 1 -Quiet

if ($ipAvailable) {
Write-Host "`nIP address $newIP is already in use. Please enter a different IP address."
} else {
$wifiAdapter = Get-NetAdapter -InterfaceAlias "Wi-Fi"
$currentConfig = $wifiAdapter | Get-NetIPAddress

$currentConfig | Remove-NetIPAddress

$wifiAdapter | New-NetIPAddress -IPAddress $newIP -PrefixLength 24 -DefaultGateway "192.168.0.1"

Get-NetIPConfiguration
}
} 
until (-not $ipAvailable)
