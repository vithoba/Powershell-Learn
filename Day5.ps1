Day 4 task

class student {
[string]$fname
[string]$lname
[string]Fullname(){return "$($this.fname)*$($this.lname)"}
}

$student1=[student]::new()

$student1.fname="dinesh"
$student1.lname="patil"
$student1.fullname()

$student1.fname=3
$student1.lname="patil"
$student1.Fullname()


==============================================PSRemoting========================================
Start-Transcript C:\ScriptHistory\day5.txt

PSRemoting

#"2016 by default it's enabled"
#interactive - enter-pssession
#non-intteractive - invoke-command

Enable-PSRemoting -Verbose

Enter-PSSession -ComputerName rakesh 

cd wsman
Get-ChildItem
Set-Location localhost
Set-Location listener
cd Listener_1084132640
Get-ChildItem



Enable-psremoting

New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP

$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName "win16-ntms"

Export-Certificate  -Cert $Cert -FilePath "C:\Temp"

New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force

Set-Item wsman:\localhost\Client\TrustedHosts -Value 192.168.1.57 -Concatenate -Force

Set-NetConnectionProfile -NetworkCategory Private

Enter-PSSession -ComputerName rakesh -Port 5986 -UseSSL -SessionOption $session -Credential $credential

$credential=Get-Credential

$session=New-PSSessionOption -SkipCACheck -SkipCNCheck


$env:COMPUTERNAME

$env:CommonProgramW6432
exit

==========================================================================================================================

$credential=Get-Credential
$session=New-PSSessionOption -SkipCACheck -SkipCNCheck
$newsession = New-PSSession -ComputerName rakesh -port 5986 -UseSSL -SessionOption $session -Credential $credential

Enter-PSSession -Session $newsession



=========================================================================================================================

#pscredential object- for giving credential in script
$username="administrator"
$password="ntms123##" | ConvertTo-SecureString -AsPlainText -Force
$cred=New-Object -TypeName System.Management.Automation.PSCredential  -ArgumentList $username,$password
$cred

get-help New-Object -Examples 

==================================

#invoke-command

$localuser=Import-Csv C:\ScriptHistory\localuser.csv
foreach ($user in $localuser)


=================================================
# take service detail for local and remote 

=============================To check services through invoke=======================


#import computer csv file

$computers=import-csv C:\computer.csv

#import service csv file

$services = import-csv C:\services.csv

#connect to one computer

foreach($comp in $computers)

{
    $username = $comp.username
    $password = $comp.password | ConvertTo-SecureString -AsPlainText -Force

    $credential = New-Object -TypeName System.Management.Automation.PSCredential $username,$password

    
    
        test-connection -ComputerName $comp.computername -ErrorVariable EV -ErrorAction SilentlyContinue -Count 1 |out-null

        If($EV -ne $null)
        {
            "not able to reach to $($comp.computername)" | out-file C:\error.log -Append
        
        }
        else
        {
            $pssessionoption = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck

             #Invoke-Command -ComputerName $comp

             $compcompliancestatus=Invoke-Command -ComputerName $comp.computername -Credential $credential -Port 5986 -UseSSL -SessionOption $pssessionoption -ScriptBlock {
        
               $serviceoutput= $using:services | select @{l="name";e={$_.servicename}} |  Get-Service | ?{$_.status -eq "Running"} | Measure-Object

               if( $serviceoutput.count -gt 0)
               {
                    $compliancestatus ="Noncompliance"
               
               }
               else
               {
                       $compliancestatus ="compliance"
               
               }
        
                # check the status of service


                #if any of the services status is running , then noncompliance 
             
                $compliancestatus
             
             
             
             }

           
           $compstatus = [pscustomobject]@{name=$comp.computername;compliancestatus=$compcompliancestatus }
           
           $compstatus  | Export-Csv C:\computercompliancestatus.csv -Append
        
        
        }

  

}
# give output to csv file

Get-Help Test-Connection -Online







