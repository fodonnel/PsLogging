<#
.SYNOPSIS
Sets the logger config file

.DESCRIPTION
LSets the logger config file. The config file must be a nlog config file

.PARAMETER FilePath
The path the the nlog config file

.NOTES
This is a wrapper function of a static .NET call, it is needed to enable unit testing.
#>
function Set-LogConfigFilePath {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $FilePath
    )

    [NLog.LogManager]::Configuration = New-Object NLog.Config.XmlLoggingConfiguration($FilePath)
}