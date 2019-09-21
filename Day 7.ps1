#DSE (Desire state service)
#DSC (Desire state configuration)
#DSC Resource
To write configuration 
configuration my complince
{
import module -name -------
Node "node1"
   {
service "bits.service" ----------> DSE resource
       {
       name="bits"
       state="stopped"
       }
   }
}
# To find module - Find-module
Get-module - Check loaded module in memory
Get-module -ListAvailable - Check all 3 path of module
find-module
$env:psmodulepath
Get-DscResource | Measure-Object
Find-Module -Name carbon
Find-Module | install-module
# DSC ---- CIM
#
Get-CimInstance -ComputerName $env:COMPUTERNAME

get-help Get-CimInstance -Examples
Get-CimInstance –Namespace root –ClassName __Namespace
Get-CimInstance -namespace root/microsoft/windows -ClassName __NAMESPACE
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_* | fw
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_DSCmetaconfiguration 
Get-DscLocalConfigurationManager
Get-DscResource -Name service -Syntax
Get-DscResource -Name file -Syntax
Get-DscResource -Name windowsfeature -Syntax

===============DSC on Local system==================================

configuration newfile
{
Import-Module -Name psdesiredstateconfiguration
    Node win16-ntms
  {

  file abhifile

    {
    Destinationpath="C:\Demo\file.txt"
    Contents="This is test file created using dsc"
    

    }
  }

}

newfile

#to push config
Start-DscConfiguration -Path "C:\Users\Administrator\newfile" -Wait -Verbose -Force


===================================Create folder and file loclly=================================================


configuration remotefile
{
Import-Module -Name psdesiredstateconfiguration
    Node win16-ntms
  {

  file abhiremotefile

    {
    Destinationpath="C:\remotehack\file.txt"
    Contents="system is hacked"
    Dependson= "[file]abhiremotefolder"

    }

     file abhiremotefolder

        {
    Destinationpath="C:\remotehack"
    Type={Directory}
    

        }

  }

}

remotefile

#to push config
Start-DscConfiguration -Path "C:\Users\Administrator\remotefile" -Wait -Verbose -Force

==================================running dsc for remote computer=========================================================


$cred=get-credential
$cso= New-CimSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck -UseSsl
$cs=New-CimSession -ComputerName rakesh -Credential $cred -SessionOption $cso

configuration remotefile
{
Import-Module -Name psdesiredstateconfiguration
    Node rakesh
  {

  file abhiremotefile

    {
    Destinationpath="C:\remotehack\file.txt"
    Contents="system is hacked"
    Dependson= "[file]abhiremotefolder"

    }

     file abhiremotefolder

        {
    Destinationpath="C:\remotehack"
    Type={Directory}
    

        }

  }

}

# to crete mof file run below command
remotefile

#to push config
Start-DscConfiguration -Path "C:\Users\Administrator\remotefile" -CimSession $cs -Wait -Verbose -Force


======================================= Group Creation ==================================================

Configuration DemoGroupConfiguration
{
    param (
    [Parameter(Mandatory)]
    [String]
    $GroupName,
    [Parameter(Mandatory)]
    [String]
    $Description,
    [Parameter()]
    [String[]] $Nodes = 'localhost'
    )
    
    Import-DscResource -ModuleName psdesiredstateconfiguration
        
        Node $Nodes
        {
         Group DemoGroup
            {
                GroupName = $GroupName
                Description = $Description
                Ensure = 'Present'
            }
    }
}

DemoGroupConfiguration -OutputPath C:\DemoGroupConfiguration -GroupName 'DemoGroup' -Description 'Demo Group' -Nodes localhost 

Start-DscConfiguration -Path "C:\Users\Administrator\DemoGroupConfiguration" -wait -Verbose -Force


====================================================== ==================================================

$MyData =
@{
    AllNodes =
    @(
        @{
            NodeName           = “*”
            LogPath            = “C:\Logs”
        },
        @{
            NodeName = “Rakesh”
            SiteContents = “C:\Site1”
            SiteName = “Website1”
        },
        @{
            NodeName = “localhost”;
            SiteContents = “C:\Site2”
            SiteName = “Website2”
        }
    );
    NonNodeData =
    @{
        ConfigFileContents = [string](Get-Content C:\Template\Config.xml)
     }
}

configuration WebsiteConfig
{
    Import-DscResource -ModuleName "xWebAdministration" -Name MSFT_xWebsite
    node $AllNodes.NodeName
    {
        xWebsite Site
        {
            Name         = $Node.SiteName
            PhysicalPath = $Node.SiteContents
            Ensure       = “Present”
        }
        File ConfigFile
        {
            DestinationPath = $Node.SiteContents + “\\config.xml”
            Contents = $ConfigurationData.NonNodeData.ConfigFileContents
        }
    }
}

websiteconfig -ConfigurationData $MyData


#visual studio code use to write script in all language


 