Get-Help Get-Service 
Get-Service | Sort-Object -Property status | Format-Table *
Get-Service| Format-Table DisplayName, Status, RequiredServices
Get-Service| Select-Object DisplayName, Status, RequiredServices | Sort-Object -Property displayname #Out-GridView