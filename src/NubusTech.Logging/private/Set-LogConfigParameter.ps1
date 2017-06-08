<#
.SYNOPSIS
Sets a Log Configuration parameter

.DESCRIPTION
Sets a Log Configuration parameter

.PARAMETER Key
The name of the parameter

.PARAMETER Value
The value of the parameter

.NOTES
This is a wrapper function of a static .NET call, it is needed to enable unit testing.
#>
function Set-LogConfigParameter {
    param (
        [Parameter(Mandatory = $true)]
        [string] $Key,

        [Parameter(Mandatory = $true)]
        [string] $Value
    )

    [NLog.GlobalDiagnosticsContext]::Set($Key, $Value)
}