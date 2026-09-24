# UC-06: Endpoint Security and Compliance

> **Status:** Six Enterprise compliance settings, including Firewall and real-time protection, reported Compliant in the [rule-level check](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md). The policy last-contacted date, device-side state and BitLocker remain separate checks.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/06-intune-management-policy-delivery.svg) · [Edit the source](../architecture/diagrams/source/06-intune-management-policy-delivery.drawio). Security settings configure the Cloud PC; compliance evaluates the result.

## Business requirement

Establish and verify a security baseline for Cloud PCs, then expose the device posture as a compliance signal without making untested security changes to production users.

## Design

Security configuration and compliance evaluation are separate:

- Endpoint security policies configure Defender Antivirus and Windows Firewall.
- The compliance policy evaluates whether the required controls are present.
- Conditional Access consumes compliance only after the compliance result is stable.

## Defender Antivirus policy

Create `W365-ENT-SEC-Defender-Pilot` under **Endpoint security > Antivirus** and configure the approved pilot settings, including:

- Real-time protection
- Behavior monitoring
- Cloud-delivered protection
- Script scanning
- Downloaded-file and attachment scanning
- Archive scanning
- Potentially unwanted application protection

Avoid configuring every available setting simply because it exists. Leave settings outside the approved baseline as **Not configured**.

### Defender validation

```powershell
Get-MpComputerStatus |
  Select-Object AMRunningMode, AntivirusEnabled, RealTimeProtectionEnabled,
    BehaviorMonitorEnabled, IoavProtectionEnabled, AntivirusSignatureLastUpdated

Get-MpPreference |
  Select-Object DisableRealtimeMonitoring, DisableBehaviorMonitoring,
    DisableIOAVProtection, DisableScriptScanning, PUAProtection,
    MAPSReporting, CloudBlockLevel, EnableNetworkProtection
```

Interpret `Disable* = False` as enabled. Do not rely only on fields that were already enabled before policy deployment; use Intune per-setting results to prove policy delivery.

## Windows Firewall policy

Create `W365-ENT-SEC-Firewall-Pilot` under **Endpoint security > Firewall**.

Configure:

- Domain profile: Enabled
- Private profile: Enabled
- Public profile: Enabled
- Default inbound behavior according to the approved baseline
- Default outbound behavior according to the approved baseline

`NotConfigured` in PowerShell output for default actions does not prove the firewall is disabled. It can mean the profile is using the Windows default or another effective policy source.

```powershell
Get-NetFirewallProfile |
  Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction
```

## Compliance policy

Create `W365-ENT-COMP-Windows-Pilot` under **Devices > Compliance policies**.

Select only controls that the Cloud PC design can reliably evaluate, such as:

- Firewall
- Antivirus
- Antispyware
- Microsoft Defender Antimalware
- Security intelligence up to date
- Real-time protection
- Trusted Platform Module where required and supported
- Minimum operating-system version based on the servicing standard

BitLocker should not be added casually. First validate Windows 365 encryption behavior, device reporting, recovery-key ownership, support procedure, and the intended compliance result.

## Validation

1. Synchronize the Cloud PC.
2. Open **Company Portal > Devices > this device > Check access**.
3. Open the Intune device record and review **Device compliance**.
4. Review the compliance policy's device status and per-setting status.
5. Confirm the final state is **Compliant** and not merely **Not evaluated**.

## Safe negative test

Use a disposable pilot only. Temporarily make one reversible compliance requirement fail, confirm **Noncompliant**, document the failed setting, restore the control, synchronize, and confirm remediation. Do not disable production antivirus or firewall as a demonstration.

## Evidence

- Defender and Firewall profile assignments
- Per-setting deployment results
- PowerShell baseline output
- Compliance per-setting status
- Company Portal access result

## Troubleshooting

| Symptom | Investigation |
|---|---|
| Policy succeeds but command output looks unchanged | Setting may already have matched; confirm per-setting status and policy source |
| Compliance is Not evaluated | Assignment, check-in, grace period, enrollment, applicability |
| Compliance is Noncompliant | Open the setting-level result before changing policy |
| Security setting conflicts | Check Endpoint security, Settings Catalog, security baselines, GPO, and Defender portal management |
| Signature age is stale | Connectivity, Defender update source, service health, scheduled tasks |

## Rollback

Remove only the pilot assignment or set the changed setting to **Not configured** after documenting the intended fallback. Compliance removal can change Conditional Access outcomes, so disable or adjust dependent CA policies first.

## References

- [Intune antivirus policy](https://learn.microsoft.com/mem/intune/protect/endpoint-security-antivirus-policy)
- [Intune firewall policy](https://learn.microsoft.com/mem/intune/protect/endpoint-security-firewall-policy)
- [Windows compliance settings in Intune](https://learn.microsoft.com/mem/intune/protect/compliance-policy-create-windows)
