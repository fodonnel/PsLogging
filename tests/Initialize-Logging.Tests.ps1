. "$PSScriptRoot\..\src\NBT.Logging\private\Set-LogConfigParameter.ps1"
. "$PSScriptRoot\..\src\NBT.Logging\private\Set-LogConfigFilePath.ps1"
. "$PSScriptRoot\..\src\NBT.Logging\public\Initialize-Logging.ps1"

Describe Initialize-Logging {
    Mock Set-LogConfigParameter
    Mock Set-LogConfigFilePath

    Context "Default logging" {
        Initialize-Logging -FileName test.log -LogDirectory "c:\logs"

        It "should set the the default log file" {
            Assert-MockCalled Set-LogConfigFilePath -Exactly 1
            Assert-MockCalled Set-LogConfigFilePath -ParameterFilter { 
                $FilePath.Endswith("default.nlog")
            }
        }

        It "should set the the log file parameters" {
            Assert-MockCalled Set-LogConfigParameter -ParameterFilter {
                $Key -eq "FileName" -And $Value -eq "test.log"
            }

            Assert-MockCalled Set-LogConfigParameter -ParameterFilter {
                $Key -eq "LogDirectory" -And $Value -eq "c:\logs"
            }
        }
    }

    Context "Console only logging" {
        Initialize-Logging -ConsoleOnly

        It "should set the the console log file" {
            Assert-MockCalled Set-LogConfigFilePath -Exactly 1
            Assert-MockCalled Set-LogConfigFilePath -ParameterFilter { 
                $FilePath.Endswith("console.nlog") 
            }
        }
    }

    Context "Custom logging" {
        Initialize-Logging -ConfigFile "c:\custom.nlog" -Parameters @{ key1="value1"}

        It "should set the the custom log file" {
            Assert-MockCalled Set-LogConfigFilePath -ParameterFilter {
                $FilePath -eq "c:\custom.nlog"
            }
        }

        It "should set the the custom parameters" {
            Assert-MockCalled Set-LogConfigParameter -ParameterFilter {
                $Key -eq "key1" -And $Value -eq "value1"
            }
        }
    }

}