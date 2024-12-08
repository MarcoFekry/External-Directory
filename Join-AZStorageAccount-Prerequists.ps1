Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -force -confirm:$false

Set-ExecutionPolicy -ExecutionPolicy Unrestricted  -force -confirm:$false

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -confirm:$false

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted  

Install-Module -Name Az -Repository PSGallery -Force


Install-PackageProvider -Name PowershellGet -MinimumVersion 1.6.0 -Force -confirm:$false

$URL= "https://github.com/Azure-Samples/azure-files-samples/releases/download/v0.2.7/AzFilesHybrid.zip"
$Path = "C:\AzFilesHybrid.zip"

Invoke-WebRequest -URI $URL -OutFile $Path 

$URL= "https://1drv.ms/u/s!Agmd1-sdw98kkrdSxRSHwqpO_omEew?e=YrirBd"
$Path = "C:\Join-AZStorageAccount-AD.ps1"

Invoke-WebRequest -URI $URL -OutFile $Path 


$DestinationPath = "C:\AzFilesHybrid"

New-Item -Path "C:\AzFilesHybrid" -ItemType Directory

Expand-Archive -Path $Path -DestinationPath $DestinationPath

cd "C:\AzFilesHybrid"

# Navigate to where AzFilesHybrid is unzipped and stored and run to copy the files into your path
.\CopyToPSPath.ps1 


Import-Module -Name AzFilesHybrid -Force 


$URL= "https://1drv.ms/u/s!Agmd1-sdw98kkrdQhCoxoE9m7CXV3A?e=OUlZwN"
$Path = "C:\MountNTFSFSlogix.ps1"

Invoke-WebRequest -URI $URL -OutFile $Path 




$URL= "https://1drv.ms/u/s!Agmd1-sdw98kkrdR0BAldEGsJ0MJvg?e=MQY0YX"
$Path = "C:\Join-AZStorageAccount-Prerequists.ps1"

Invoke-WebRequest -URI $URL -OutFile $Path 

