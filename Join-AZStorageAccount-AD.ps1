$URL= "https://github.com/Azure-Samples/azure-files-samples/releases/download/v0.2.7/AzFilesHybrid.zip"
$Path = "C:\AzFilesHybrid.zip"

Invoke-WebRequest -URI $URL -OutFile $Path

$Path = "C:\AzFilesHybrid.zip"
$DestinationPath = "C:\AzFilesHybrid"
Expand-Archive -Path $Path -DestinationPath $DestinationPath

cd "C:\AzFilesHybrid"

# Navigate to where AzFilesHybrid is unzipped and stored and run to copy the files into your path
.\CopyToPSPath.ps1 

# Import AzFilesHybrid module
Import-Module -Name AzFilesHybrid -Force 

Import-Module -Name Az -Force 

$SecurePassword = ConvertTo-SecureString  $AZAccountPassword -AsPlainText -Force

$Credential =New-Object System.Management.Automation.PsCredential($ApplicationId,$SecurePassword)

Connect-AzAccount -ServicePrincipal -Credential $Credential -TenantId $TenantId -Subscription $SubscriptionId

Select-AzSubscription -Subscription $SubscriptionId

$DomainAccountType = "ComputerAccount"

$EncryptionType = "AES256|RC4|AES256,RC4"

Join-AzStorageAccount -ResourceGroupName $ResourceGroupName -StorageAccountName $StorageAccountName -SamAccountName $SamAccountName -DomainAccountType $DomainAccountType -EncryptionType $EncryptionType -confirm:$false
