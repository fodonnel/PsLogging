. "$PSScriptRoot\..\src\NBT.Logging\private\Write-LogMessage.ps1"
. "$PSScriptRoot\..\src\NBT.Logging\private\Format-LogMessage.ps1"
. "$PSScriptRoot\..\src\NBT.Logging\public\Write-LogDebug.ps1"

Describe Write-LogDebug {
    Mock Get-PSCallStack -MockWith { @(@{ Command = "current" }; @{ Command = "caller"}) }
    Mock Format-LogMessage -MockWith { $Message }
    Mock Write-LogMessage

    Context "Write an debug log message" {
        Write-LogDebug -Message "message"

        It "should write a log message" {
            Assert-MockCalled Write-LogMessage -Exactly 1

            Assert-MockCalled Write-LogMessage -ParameterFilter {
                $Level -eq "Debug" -And
                $Message -eq "message" -And
                $LoggerName -eq "caller"
            }
        }
    }
}