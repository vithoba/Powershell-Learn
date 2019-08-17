$PSVersionTable

Get-Service
Get-EventLog Application
Stop-Service -Name BITS

Get-Command -Noun Service
Get-Command -Verb get
Get-Command -Module Azure

Get-Help Get-Service -Examples
Get-Help Get-Service -Online
Get-Help Get-Service -ShowWindow
Update-Help
Get-Command -Noun *VM* -Module Azure* | Out-File d:\azurepowershel.txt
get-help New-AzureRmVM -Examples
get-help Get-Service -Examples
Get-Service -Name win*
Get-Service -Name *win*
Get-Service -Name win*
Get-EventLog -LogName System -Source WindowsUpdateClient
Get-Help Get-EventLog -Examples

Get-EventLog -LogName System -Source BR

Get-EventLog -LogName System -Source browser -Newest 5 -EntryType Error | Out-File d:\event.txt

Get-EventLog -LogName System -Source "Microsoft-Windows-Kernel-General" -Newest 5 | export-csv d:\event1.csv

Get-Command -Noun file
Get-PSProvider
Get-Command -Noun *Item
Get-Command -Name *childitem*
get-help Get-ChildItem 
Get-ChildItem HKLM:\SOFTWARE -Recurse
Get-Item HKLM:\SOFTWARE
Get-ItemProperty HKLM:\SOFTWARE
Get-Item D:\sumit\adc\vmware.log
Get-ChildItem D:\
Get-ItemProperty D:\
Get-ChildItem Env:\APPDATA
Get-Item Env:\APPDATA
Get-ItemProperty Env:\APPDATA
New-Item -Path c:\ISA -ItemType File -Name ISA

New-Item -Path c:\ -ItemType Directory -Name IAC
New-Item -Path C:\IAC -ItemType File -Name Azure.txt

Add-Content -Value "WindowAzure" -Path C:\IAC\Azure.txt
Set-Content -Value azurevmcreation -Path C:\IAC\Azure.txt
Set-ItemProperty -Path C:\IAC -Name IsReadOnly -Value $Tru
Get-ChildItem C:\IAC\Azure.txt | Set-ItemProperty -Name CreationTime -Value "8/10/2019 1:22:00 AM"

New-Item -Path C:\IAC -ItemType File -Name azurerm.csv -Value radome -Force
\
Get-ChildItem C:\IAC\Azure.txt | Set-ItemProperty

Get-ChildItem -Path C:\IAC\azurerm.csv | fl *

Get-ChildItem C:\IAC\azurerm.csv | Set-ItemProperty -Name CreationTime -Value "8/10/2019 1:22:00 AM"

get-help Add-Content -Examples

get-help Get-ItemPropertyValue
Get-Help New-Item -Online


get-help New-Item -Online

Get-Command -Name Set-ItemProperty

get-help Set-ItemProperty -Examples

Get-Service | Get-Member

"1" | Get-Member


"this is my first day".Split(" ")

"this is my first day".IndexOf(0)
"santosh".Substring(3)
Get-Service | Get-Member
Get-AzureRmVM | Get-Member
Get-Member -InputObject (Get-Service)
$array = @("microsoft","Ora","linux")
$array
$array | Get-Member
Get-Member -InputObject $array
$array[2] = "ora"
$array
