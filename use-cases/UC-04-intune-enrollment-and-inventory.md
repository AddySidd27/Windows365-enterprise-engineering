# UC-04: Intune Enrollment and Device Inventory

> **Status:** An existing Enterprise Cloud PC showed a populated primary user, Corporate ownership, compliance, and a check-in in the [pilot record](../evidence/UC-02-2026-09-24-portal-check.md). A [follow-up](../evidence/UC-04-05-06-2026-09-24-follow-up.md) observed a later check-in. A fresh auto-enrollment trace and sanitized enrollment screenshot remain pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/06-intune-management-policy-delivery.svg) · [Edit the source](../architecture/diagrams/source/06-intune-management-policy-delivery.drawio). The management path begins after the service enrolls the Cloud PC.

## Business requirement

Confirm that every provisioned Cloud PC is correctly joined, enrolled, owned, assigned, and actively checking in before production policy is deployed.

## Enterprise enrollment boundary

Windows 365 Enterprise enrolls the Cloud PC into Intune during provisioning without the user entering enrollment credentials. The manual enrollment troubleshooting observed in the Business lab is not an Enterprise deployment step. If an Enterprise Cloud PC is absent from Intune, check the Windows 365 provisioning state and error before attempting any device-side enrollment action.

## Implementation and validation

1. Open **Microsoft Intune admin center > Devices > All devices**.
2. Open the Cloud PC device record.
3. Record and validate:
   - Device name
   - Operating-system version
   - Microsoft Entra join type
   - Ownership
   - Primary user
   - Compliance state
   - Last check-in
   - Management agent
4. Review ownership. Change it to **Corporate** only if the tenant shows an incorrect value and organizational policy requires the change.
5. Add the device to `W365-ENT-Pilot-Devices`.
6. On an already enrolled Cloud PC, open **Settings > Accounts > Access work or school > connected work account > Info > Sync**. This triggers a policy check-in; it does not replace Enterprise provisioning or enrollment.
7. Refresh the device record and confirm the check-in timestamp changes.

## Device-side commands

```powershell
dsregcmd /status
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsBuildNumber
Get-ScheduledTask -TaskPath "\Microsoft\Windows\EnterpriseMgmt\*" -ErrorAction SilentlyContinue |
  Select-Object TaskName, State
```

## Expected result

- Microsoft Entra join is healthy.
- An MDM URL is present in `dsregcmd /status`.
- Cloud PC exists once in Microsoft Intune without stale duplicate records.
- Ownership and primary user match the management design.
- A manual Sync produces a newer check-in.

## Evidence

- Sanitized Intune device overview
- Access work or school MDM connection
- `dsregcmd /status` device-state and tenant sections
- Updated last check-in timestamp

## Troubleshooting path

1. Confirm the correct tenant and user identity.
2. Confirm the device is Microsoft Entra joined.
3. Confirm MDM authority and Intune entitlement.
4. Check the EnterpriseMgmt scheduled tasks.
5. Export MDM diagnostics from **Settings > Accounts > Access work or school**.
6. Review DeviceManagement-Enterprise-Diagnostics-Provider event logs.
7. Avoid removing the device record until identity, enrollment, and duplicate-record impact are understood.

## Rollback

Changing ownership or group membership is reversible. Record the original value before the change. Do not delete the Intune or Entra device record as a first troubleshooting step. Deletion can break identity and management links and may require a new enrollment or reprovision.

## References

- [Windows 365 architecture and Intune integration](https://learn.microsoft.com/windows-365/enterprise/architecture)
- [Windows 365 Enterprise device management](https://learn.microsoft.com/windows-365/enterprise/device-management-overview)
- [Automated provisioning steps](https://learn.microsoft.com/windows-365/enterprise/automated-provisioning-steps)
