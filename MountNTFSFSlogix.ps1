[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]    
    [string]$ProfilePath = '',

    [Parameter(Mandatory=$true)]    
    [string]$storageaccountname = '',

    [Parameter(Mandatory=$true)]    
    [string]$desireddriveletter = '',

    [Parameter(Mandatory=$true)]    
    [string]$storageaccountkey = '',

    [Parameter(Mandatory=$true)]    
    [string]$GroupName = ''

    )


$desireddriveletter = $desireddriveletter + ":"
$group = $env:USERDOMAIN + "\" + $GroupName
$groupdetails = '"' + $group + ":" + '(M)' + '"'

$command1 = "net use " + $desireddriveletter + " " + $ProfilePath + " " + $storageaccountkey + " /user:Azure\" + $storageaccountname + " `n"
$command2 = "icacls " +  $desireddriveletter +" /grant "+  $groupdetails + " `n"

$ownerdetails = '"' + "Creator Owner:(OI)(CI)(IO)(M)" + '"'
$command3 = "icacls " + $desireddriveletter +" /grant "+ $ownerdetails + " `n"

$Authenticateddetails = '"' + "Authenticated Users" + '"'
$command4 = "icacls " + $desireddriveletter +" /remove "+ $Authenticateddetails + " `n"

$Builtinddetails = '"' + "Builtin\Users" + '"'
$command5 = "icacls " + $desireddriveletter +" /remove "+ $Builtinddetails

$command1 , $command2 ,$command3 , $command4 ,$command5  | out-file C:\MountAzureFiledrive.ps1 -Force


      $data1 = '$ProfilePath =' + "'" + $ProfilePath + "'" + " `n"

      $data2 =  '$storageaccountname =' + "'" + $storageaccountname + "'" + " `n"

      $data3 = '$desireddriveletter =' + "'" + $desireddriveletter + "'" + " `n"
 
      $data4 = '$storageaccountkey =' + "'" + $storageaccountkey + "'" + " `n"

      $data5 =  '$GroupName =' + "'" + $GroupName + "'" + " `n"





      $Content1 = Get-ChildItem "C:\" -Filter "MountNTFSFSlogix.ps1" 

    $content = Get-Content "C:\MountNTFSFSlogix.ps1"

    $newline = $data1 , $data2 , $data3 , $data4 , $data5 

    
    
    $newcontent = $newline, $content | out-file -FilePath "C:\MountNTFSFSlogix1.ps1" -Force

    Remove-Item -path "C:\MountNTFSFSlogix.ps1" -Force

    Rename-Item -Path "C:\MountNTFSFSlogix1.ps1" -NewName "C:\MountNTFSFSlogix.ps1"

    Remove-Item -path "C:\MountNTFSFSlogix.ps1" -Force