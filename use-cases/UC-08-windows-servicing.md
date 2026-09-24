# UC-08: Windows Servicing with Windows Update for Business

> **Status:** Business pilot ring creation reported; update, restart, and Enterprise evidence pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/08-application-update-delivery.svg) · [Edit the source](../architecture/diagrams/source/08-application-update-delivery.drawio). The update ring sets policy while Windows Update provides approved content.

## Business requirement

Keep Cloud PCs current using a controlled pilot deployment, predictable deadlines, user-aware restart behavior, and reporting without operating an on-premises patch-content distribution system.

## Architecture decision

Intune sends the Windows Update for Business policy. The Cloud PC normally downloads update content from Microsoft. An approved cache or Delivery Optimization design can reduce internet traffic. Intune does not work like an SCCM distribution point that stores and pushes every patch.

## Pilot update ring

Create `W365-ENT-UPD-Pilot` under **Devices > Windows > Windows updates > Update rings**.

Example pilot decisions:

- Microsoft product updates: Allowed where approved
- Windows drivers: Controlled according to the driver strategy
- Quality update deferral: 0 days for the lab pilot
- Feature update deferral: Use a separately approved feature-update strategy in production
- Automatic update behavior: Install during automatic maintenance or the approved equivalent
- Active hours: Match the pilot user's working window
- Quality-update deadline: Short pilot deadline with reasonable grace period
- Restart checks and notifications: Enabled according to the user-experience standard

Assign only `W365-ENT-Pilot-Devices`.

## Before validation

```powershell
Get-ComputerInfo |
  Select-Object WindowsProductName, WindowsVersion, OsBuildNumber

Get-HotFix |
  Sort-Object InstalledOn -Descending |
  Select-Object -First 10 HotFixID, Description, InstalledOn
```

Record the Windows build, most recent quality update, and pending-restart state.

## Deployment validation

1. Synchronize the Cloud PC from **Access work or school** or the Intune device action.
2. Review the update ring's device and per-setting status.
3. Open **Settings > Windows Update** inside the Cloud PC.
4. Confirm the page reflects organization-controlled settings where applicable.
5. Select **Check for updates**.
6. Save user work before installation or restart.
7. Reconnect after restart and capture the new build/hotfix state.

## Patch control strategy

An update ring controls experience, deferrals, deadlines, active hours, and restart behavior. It is not a reliable tool for permanently selecting arbitrary individual quality-update KBs while accepting all others.

For problematic updates, use the supported control matching the update type and current service capability:

- Pause quality or feature updates for scoped devices
- Use expedited quality updates for urgent security deployment
- Use feature update policies to hold devices to an approved Windows release
- Use driver update policies to approve, defer, or decline applicable drivers
- Use Known Issue Rollback when Microsoft provides it for a qualifying regression
- Validate uninstall support and security risk before removing a cumulative update

Because Windows quality updates are cumulative, long-term exclusion of one security fix is generally not equivalent to traditional per-patch approval in Configuration Manager.

## Evidence

- Update-ring configuration and assignment
- Intune deployment status
- Windows Update policy-controlled experience
- Before and after build/hotfix output
- Restart notification and reconnect result

## Troubleshooting

| Symptom | Investigation |
|---|---|
| Ring is assigned but settings do not appear | Device check-in, applicability, policy conflict, reporting latency |
| Scan finds no updates | Device is current, safeguard hold, pause/deferral, service health |
| Update download fails | Microsoft endpoint access, proxy/TLS inspection, Delivery Optimization, disk space |
| Restart occurs unexpectedly | Deadline, grace period, active hours, user notification settings |
| Feature update does not offer | Feature update policy, safeguard hold, hardware/app compatibility |

## Rollback

Remove the pilot assignment or revise the ring only after checking overlapping update policies. Do not force a restart during an active session without user coordination and saved work.

## References

- [Windows update management in Intune](https://learn.microsoft.com/intune/device-updates/windows/)
- [Windows Update rings in Intune](https://learn.microsoft.com/intune/device-updates/windows/manage-update-rings)
- [Windows Update for Business reports](https://learn.microsoft.com/windows/deployment/update/wufb-reports-overview)
