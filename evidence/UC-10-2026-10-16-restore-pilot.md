# UC-10: Restore-point pilot, 16 October 2026

## Scope and baseline

- Tenant: Windows 365 Enterprise pilot. One Microsoft-hosted Cloud PC was **Provisioned** and compliant in Intune. The existing provisioning policy was not changed.
- Pilot assignment: `Windows365-Group` had one direct member, the assigned pilot user.
- Before the change, **Devices > All Cloud PCs > pilot device > Restore points** showed 14 automatic points. The latest displayed time was 16 October 2026, 8:07:18 AM. Portal time-zone context was not independently checked.
- [Sanitized Intune restore-point list](w365-restore-points-public-20261016.jpg). This crop shows the timestamps and point types; it omits tenant and device identifiers.

## Actions and observed result

1. In **Devices > Cloud PC Settings > Create > User settings**, created `W365 Restore Pilot - 2026-10-16`. The review page showed **Every 12 hours** for restore-point frequency. **Local admin**, **user reset**, **user-initiated restore**, and user-initiated disaster recovery were **No**.
2. Assigned the setting only to `Windows365-Group`. Intune displayed **Successfully added new user setting**. The settings table listed it as **Assigned: Yes**. The assignment is a configuration result; a new scheduled point had not yet been observed.
3. On the sole Cloud PC, selected **Create Restore Points** with the optional sharing choice left off. Intune acknowledged the request and warned that creation may take an hour or longer. The device action listed **TakeSnapshot: Pending** at the last check. The restore-point list still showed only automatic points.

## Outcome and limits

**Partial:** policy saved and manual snapshot requested. The manual point was not yet confirmed in the list, and its health was not checked. No disk restore, bulk restore, or user-initiated restore was run. A restore would discard local changes after the selected point; the sole working pilot was preserved. An end-to-end rollback test requires a disposable second Cloud PC, a before-state marker, a completed action, reconnect, and device and user checks.

## Follow-up

- Reopen the restore-point list and device action status; record the manual point only when it appears and the action completes.
- Review the policy assignment result after service processing.
- For a disposable restore lab, capture before and after local marker, sign-in, apps, compliance, and Intune check-in. Do not treat a point inventory as proof of successful recovery.

## Reference

- [Microsoft Learn: Point-in-time restore overview](https://learn.microsoft.com/en-us/windows-365/enterprise/restore-overview)
- [Microsoft Learn: Configure restore settings](https://learn.microsoft.com/en-us/windows-365/enterprise/restore-configure)
- [Microsoft Learn: Restore a single Cloud PC](https://learn.microsoft.com/en-us/windows-365/enterprise/restore-single-cloud-pc)
