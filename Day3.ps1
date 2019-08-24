Start-Transcript C:\ScriptHistory\day3.txt
Get-Command -Noun *date

 http://tasteofpowershell.blogspot.com/2009/09/regular-expression-cheat-sheet-for.html

=======================================Hash Table===================

$student=@(
@{name="dinesh"},
@{name="basant"},
@{name="prashant"}
)
$student

array in hashtable

$studentdetails=@{name="dinesh"
 sub=@("science","maths","marathi")}

 $studentdetails

 $student.name
 $studentdetails.sub
 $student.keys
 $student.values

 $studentdetails|gm
 $studentdetails.ContainsKey("sub")
 $studentdetails.ContainsKey("name")
 $studentdetails.add("history","60")
  $studentdetails.add("maths","dd")
  Get-Service | Stop-Process -WhatIf
  Get-Process | Stop-Service -WhatIf
 get-help Get-Process -ShowWindow
 Get-ChildItem C:\Windows\System32 | Stop-Process 
get-help stop-Process -ShowWindow
Get-ChildItem | gm
Get-LocalUser | Disable-LocalUser
$myservices=import-csv "C:\ScriptHistory\service.csv"

===============================================================


$Aduser=import-csv C:\ScriptHistory\ADusers.csv
$Exusers=import-csv C:\ScriptHistory\Exchange.csv

foreach($ADusers in $ADuser )
{

foreach ($Exchangeusers in $Exusers)

    {

    if($Adusers.mail -eq $Exchangeusers.email)
    
    {
    
    $Adusers.mail,$Exchangeusers.totalsizeiteam | out-file C:\Demo\exchange.csv -Append
    
    }

    else
    
    {
    $Adusers.mail | out-file C:\Demo\nomatch.csv
    }
    
    
    }
    
    }

    =======================================foreach=======================================

    $Aduser=import-csv C:\ScriptHistory\ADusers.csv
$Exusers=import-csv C:\ScriptHistory\Exchange.csv

foreach($ADusers in $ADuser )
{

foreach ($Exchangeusers in $Exusers)

    {

    if($Adusers.mail -eq $Exchangeusers.email)
    
    {
    
    $Adusers.mail,$Exchangeusers.totalsizeiteam | Export-Csv C:\Demo\exchange.csv -Append
    
    }

    else
    
    {
    $Adusers.mail | Export-Csv C:\Demo\nomatch.csv
    }
    
    
    }
    
    }

=================================================where Object==========================
   $Aduser=import-csv C:\ScriptHistory\ADusers.csv
$Exusers=import-csv C:\ScriptHistory\Exchange.csv

foreach($adusers in $Aduser)
   {
   
   $Matched=$Exusers | Where-Object {$_.email -eq $Adusers.Mail} |Measure-Object
   
   if($matched.Count -ge 1)
     {
     $matchuser=$Exusers |Where-Object{$_.email -eq $Adusers.mail}
   $Adusers.name,$matchuser.totalsizeiteam | Out-File c:\demo\matched.csv -Append
     }
   else
   {
   $adusers.name | Out-File C:\Demo\notmatched.csv -Append
   }
   
   
   } 

   =================================export-csv (how to avoid getting length)=======================================
   $Aduser=import-csv C:\ScriptHistory\ADusers.csv
$Exusers=import-csv C:\ScriptHistory\Exchange.csv

foreach($adusers in $Aduser)
   {
   
   $Matched=$Exusers | Where-Object {$_.email -eq $Adusers.Mail} |Measure-Object
   
   if($matched.Count -ge 1)
    
     {
      $matchuser=$Exusers |Where-Object{$_.email -eq $Adusers.mail}
     
     
      
      $outputuser=[PSCustomObject]@{
      
      name=$Adusers.Name
      
      MilBoxSize=$Matchuser.totalsizeiteam
      
      }
      $outputuser | Export-Csv C:\Demo\matchusers1.csv -Append

     }
     #$outputuser | out-file C:\Demo\matchusers21.csv -Append
     
    
   } 

=======================================================   =============================================

Get-Process | Where-Object{$_.ws -ge 100KB}|Select-Object WS | Export-Csv C:\Demo\ws.csv


Get-Process | Where-Object {$_.ws -ge 100KB} | select name,@{l="ws(MB)";e={$_.ws/1MB}}


==================================================================================================

$text="dinesh"
$reversetext=""
for ($i=$text.Length;$i-ge 0; $i--)
{
$reversetext=$revertext+$text[$i]

}
$reversetext

