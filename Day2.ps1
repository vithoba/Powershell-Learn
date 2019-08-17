Start-Transcript C:\ScriptHistory\History.txt
===================================================

Get-Service | GM

"Santosh" | Get-Member

"Santosh".Length

"santosh".Contains("t")

"santosh".Contains("y")

"santosh".Replace("t","$")

"SANTOSH".ToLower()

"santosh".Remove(1)

$name="santosh"

$name

write-host "$name"

Write-Host $name

Write-Host '$name'

$name="This is my name 'santosh'"
$name='This is my name "$name"'
$name

$myArr=@("microsot";"Azure")
$myArr

$myArr[0]

$myArr | Get-Member

Get-Member -InputObject $myArr

$myArr.Length

Get-PSProvider
Get-Command -Noun "PSProvider"

Get-ChildItem c:\
Get-Item c:\
Get-ChildItem C:\Windows -Recurse
Get-ChildItem *win*
Get-childItem -Path c:\
Get-ItemProperty -Path C:\Windows | fl *
Get-ItemProperty C:\Windows | fl *


Get-Item Env:\windir
Get-Item Env:\Path
Get-ChildItem Cert:\LocalMachine\Root\02FAF3E291435468607857694DF5E45B68851868
Get-ChildItem Cert:\CurrentUser -Recurse
Get-ChildItem cert:\ -Recurse

New-Item c:\ -Name Demo -ItemType Directory

New-Item C:\Demo -ItemType file -Name demo1.txt

Add-Content C:\Demo\demo1.txt -Value welcome

Get-ChildItem C:\Windows | Out-File C:\Demo\demo.txt

Get-ChildItem C:\Windows | Export-Csv C:\Demo\demo.csv -Append

$path=Read-host

Get-ChildItem -Path $path 

Get-Help Read-Host -Examples
Read-Host 

Write-Host "give your path" 
$path=Read-Host
Get-ChildItem

#to addition number--------------------------------------

Write-host "give number"
$number1=Read-Host
Write-host "give number"
$number2=Read-host
$num3=$number1.ToInt32($null)
$num4=$number2.ToInt32($null)
#Write-Host "addition is $number1 + $number2"
#Write-Host "addition is" $num3 + $num4
#Write-Host "addition is" ($num3 + $num4)
Write-Host "Multi is" ($num3*$num4)

[int]$number1=Read-Host
$number1 | gm

--------------------------------------------Oprators-----


Get-Help about-oprators

Write-host "give number"
[int]$number1=read-host 
Write-host "give number"
[int]$number2=Read-Host

if($number1 -lt $number2)
    {#true Condition
    Write-Host "$number1 is lesser than $number2"}
    else
    {#false cnodition
    Write-Host "$number1 is greater than $number2"
    }

=========================== else if ==================================

$service=Get-Service -Name BITS
#$service
if($service.Status -eq "Stopped")

{Write-Host "The Services stopped"}

elseif ($service.Status -eq "Running")

{ write-host "The Services Running"}

else 
{Write-Host "The Services Suspended"}
 
=============================   Switch  ===================================

Get-Help About_switch
Update-Help

$service1=Get-Service -Name BITS
#$service1
switch ($service1.Status)
    {

    stopped {write-host "The service is stopped"}

    Running {Write-Host "The Services is Running"}

    Default {write-host $service1.Status}

    }

============================== Reguler Expression   ============================================

"11" -eq 11
11 -eq "11"

"Santosh" -match "nt"
"Santosh" -match "ba"
"Santosh" -match "^s"
"Santosh" -match "^a"
"Santosh" -match "$h"
"Santosh" -match "s$"
"SantoS" -match "^s$"
"Santosh" -match "^s....h$"
"Santosh" -match "^s......$"

"dinesh" -match "^d{5}$"
"dddddd" -match "^d{5}$"
"dddd" -match "^d{5}$"
"dddddd" -match "^d{5,}$"
"ddddddddd" -match "^d{5,7}$"
"ddddddd" -match "^d{5,7}$"

get-help about_resule
=================================for loop  ==============================================

for($i=0 ;$i -eq 10;$i=$i+1)
{
$i


}


for($i=0 ;$i -lt 5;$i=$i+1)
{
write-host {*} -Separator ", "

}

get-help Write-Host -Examples



Get-Help Write-Host -Examples








