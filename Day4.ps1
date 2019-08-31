===================================Class======================================
Start-Transcript -Path C:\ScriptHistory\day4.txt
class Admailbox
{
 [string]$name
 [int]$totaliteamsize

}

$admailboxvalue=new-object -TypeName admailbox
$admailboxvalue | gm
$admailboxvalue.name
$admailboxvalue.name="dinesh"
$admailboxvalue.totaliteamsize="10"
$admailboxvalue| Export-Csv c:\demo\1.csv


=======================================================

Start-Transcript -Path C:\ScriptHistory\day4.txt
class Admailboxes
{
 [string]$name

 [int[]]$totaliteamsize

}
$admailboxvalue | gm
$admailboxvalue=new-object -TypeName admailbox
$admailboxvalue | gm
$admailboxvalue.name
$admailboxvalue.name="dinesh"
$admailboxvalue.totaliteamsize="10"
$admailboxvalue| Export-Csv c:\demo\1.csv

=============================================================
$classArray=@(1,2,6,12,13,24,26)

$classArray | Sort-Object -Descending

$classArraystring=@("1","2","6",12,"13","24","26")

$classArraystring | Sort-Object

===========================calcultor class==============================

class mycalculator

{
[int]$firstnumber
[int]$secondnumber

[int]add()
{return $this.firstnumber+$this.secondnumber}

[int]Multiply()
{return $this.firstnumber*$this.secondnumber}

[int]Subtract()
{return $this.firstnumber-$this.secondnumber}

[int]Division()
{return $this.firstnumber/$this.secondnumber}

[void]clear()
{
$this.firstnumber=$null
$this.secondnumber=$null}

}

$mycalc=new-object -TypeName mycalculator

$mycalc.firstnumber=100
$mycalc.secondnumber=200
$mycalc.add()
$mycalc.Division()
$mycalc.Multiply()
$mycalc.Subtract()

$mycalc |gm


 
=============================================Error Handler======

$Error[0] | gm
$PSVersionTable
generate-error
$error[0].InvocationInfo
$error[0].Exception
$error[0].CategoryInfo
$error[0].ErrorDetails

$ErrorActionPreference | gm
$ErrorActionPreference

Stop-Service sdfsdfsdf -ErrorAction SilentlyContinue

Stop-Service sdfsdfsdf -ErrorAction Continue -ErrorVariable ERv
$ERv|gm

$service=@("Bits","wsusupdate","nonsrv")
$service | Stop-Service -ErrorAction Continue -ErrorVariable stop
$stop
$stop | gm

$stop -eq $null
if($stop -ne $null) 
{





}
else
{


}


=========================try-catch=======================================
try
{

Stop-Service ntms -ErrorAction Stop

}
catch
{

$_.exception.Message | Out-File C:\Demo\ntmssr.txt -Append

}
finally
{

}


====================================================================================

Get-Process | Export-Csv C:\Demo\process.csv

$import=Import-Csv C:\Demo\process.csv

try
{
foreach($imports in $import)
{

-ErrorAction Stop

}


}
catch
{

$_.exception.Message | Out-File C:\Demo\ntmssr.txt -Append

}
finally
{

}
