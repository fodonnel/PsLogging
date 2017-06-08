function Initialize-Logging {
    param (
        [Parameter(Mandatory = $true, ParameterSetName = "DefaultConfigFile")]
        [string] $FileName,

        [Parameter(Mandatory = $true, ParameterSetName = "DefaultConfigFile")]
        [string] $LogDirectory,

        [Parameter(Mandatory = $true, ParameterSetName = "ConsoleOnly")]
        [Switch] $ConsoleOnly,

        [Parameter(Mandatory = $true, ParameterSetName = "CustomConfigFile")]
        [string] $ConfigFile,

        [Parameter(Mandatory = $true, ParameterSetName = "CustomConfigFile")]
        [HashTable] $Parameters
    )

    if ($FileName) {
        Set-LogConfigParameter -Key FileName -Value $FileName
        Set-LogConfigParameter -Key LogDirectory -Value $LogDirectory
        Set-LogConfigFilePath -FilePath "$PSScriptRoot/../configs/default.nlog"
    }

    elseif ($ConfigFile) {
        if ($Parameters) {
            foreach ($key in $Parameters.keys) {
                Set-LogConfigParameter -Key $key -Value $Parameters[$key]
            }
        }

        Set-LogConfigFilePath -FilePath $ConfigFile
    }

    else {
        Set-LogConfigFilePath -FilePath "$PSScriptRoot/../configs/console.nlog"
    }
}