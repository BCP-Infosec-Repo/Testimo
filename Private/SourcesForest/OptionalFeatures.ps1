﻿$OptionalFeatures = [ordered] @{
    Enable = $false
    Source = [ordered] @{
        Name    = 'Optional Features'
        Data    = {
            # Imports all commands / including private ones from PSWinDocumentation.AD
            $ADModule = Import-Module PSWinDocumentation.AD -PassThru
            & $ADModule { Get-WinADForestOptionalFeatures -WarningAction SilentlyContinue }
        }
        Details = [ordered] @{
            Area             = 'Features'
            Explanation      = ''
            Recommendation   = ''
            RiskLevel        = 10
            RecommendedLinks = @(

            )
        }
    }
    Tests  = [ordered] @{
        RecycleBinEnabled    = @{
            Enable     = $true
            Name       = 'Recycle Bin Enabled'
            Parameters = @{
                Property      = 'Recycle Bin Enabled'
                ExpectedValue = $true
                OperationType = 'eq'
            }
        }
        LapsAvailable        = @{
            Enable     = $true
            Name       = 'LAPS Schema Extended'
            Parameters = @{
                Property      = 'Laps Enabled'
                ExpectedValue = $true
                OperationType = 'eq'
            }
        }
        PrivAccessManagement = @{
            Enable     = $true
            Name       = 'Privileged Access Management Enabled'
            Parameters = @{
                Property      = 'Privileged Access Management Feature Enabled'
                ExpectedValue = $true
                OperationType = 'eq'
            }
        }
    }
}