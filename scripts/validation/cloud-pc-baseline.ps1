[CmdletBinding()]
param()

$ErrorActionPreference = 'Continue'

Write-Output '=== Computer ==='
Get-ComputerInfo |
    Select-Object WindowsProductName, WindowsVersion, OsBuildNumber, CsName

Write-Output '=== Microsoft Entra join ==='
dsregcmd /status

Write-Output '=== Defender ==='
Get-MpComputerStatus |
    Select-Object AMRunningMode, AntivirusEnabled, RealTimeProtectionEnabled,
        BehaviorMonitorEnabled, IoavProtectionEnabled, AntivirusSignatureLastUpdated

Write-Output '=== Defender preferences ==='
Get-MpPreference |
    Select-Object DisableRealtimeMonitoring, DisableBehaviorMonitoring,
        DisableIOAVProtection, DisableScriptScanning, PUAProtection,
        MAPSReporting, CloudBlockLevel, EnableNetworkProtection

Write-Output '=== Firewall ==='
Get-NetFirewallProfile |
    Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction

Write-Output '=== BitLocker state (validation only) ==='
Get-BitLockerVolume |
    Select-Object MountPoint, VolumeStatus, ProtectionStatus, EncryptionPercentage

Write-Output '=== Intune scheduled tasks ==='
Get-ScheduledTask -TaskPath '\Microsoft\Windows\EnterpriseMgmt\*' -ErrorAction SilentlyContinue |
    Select-Object TaskName, State
