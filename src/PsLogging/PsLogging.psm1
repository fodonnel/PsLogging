Add-Type -path "$PSScriptRoot/libs/NLog.dll" -PassThru -ErrorAction Stop | Out-Null

. $PSScriptRoot\private\Format-LogMessage.ps1
. $PSScriptRoot\private\Set-LogConfigFilePath.ps1
. $PSScriptRoot\private\Set-LogConfigParameter.ps1
. $PSScriptRoot\private\Write-LogMessage.ps1

. $PSScriptRoot\public\Initialize-Logging.ps1
. $PSScriptRoot\public\Write-LogTrace.ps1
. $PSScriptRoot\public\Write-LogDebug.ps1
. $PSScriptRoot\public\Write-LogInfo.ps1
. $PSScriptRoot\public\Write-LogWarn.ps1
. $PSScriptRoot\public\Write-LogError.ps1
. $PSScriptRoot\public\Write-LogFatal.ps1
