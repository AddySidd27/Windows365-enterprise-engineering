# UC-02: Existing Enterprise Cloud PC pilot check

Date (UTC): 2026-09-24
Environment and edition: Windows 365 Enterprise, dedicated Cloud PC
Scope: one existing Cloud PC and its assigned pilot user; identifiers withheld
Method: signed-in Microsoft Intune admin center inspection of All Cloud PCs, device Overview, Device configuration, and provisioning policy Properties; then a pilot-user Windows App web session and read-only commands in the Cloud PC. This was not a new provisioning run.

| Check | Observed in portal | Limit |
|---|---|---|
| Cloud PC count and state | One record; **Provisioned**; zero failed and zero provisioning | State at time of inspection, not end-to-end provisioning trace |
| Provisioning policy | Enterprise license type; full Cloud PC desktop; Microsoft Entra Join; single sign-on enabled; gallery image Windows 11 Enterprise + Microsoft 365 Apps 25H2; English (United States) | Network geography/region was not established from this view |
| Cloud PC size | Enterprise 2 vCPU, 4 GB RAM, 64 GB storage | Performance under load not tested |
| Intune record | Corporate ownership, primary user populated, compliant, last check-in shown on 2026-09-24 | Device-side join checked below; compliance rule details not inspected |
| Configuration reports | Edge settings catalog, wallpaper settings catalog, Defender Antivirus, and pilot update policy showed **Succeeded** for this Cloud PC | Portal status alone does not prove the visible Edge setting, wallpaper, antivirus state, or installed update on the device |

## User session and device-side checks

The assigned pilot user signed in to Windows App web, selected the **Enterprise** Cloud PC (not the separate Business card), and reached a usable Windows desktop. The first web-client attempt returned HTTP 502; a reload opened the connection settings and the next connection reached the desktop. Camera and location redirection were unchecked for this session.

On the Enterprise desktop, `dsregcmd /status | findstr Joined` returned:

```text
AzureAdJoined : YES
EnterpriseJoined : NO
DomainJoined : NO
WorkplaceJoined : NO
IsDeviceJoined : YES
```

`cmd /c ver` returned `Microsoft Windows [Version 10.0.26200.9457]`. This is a Windows version/build check, not a full edition or patch-history report. Identifiers and tenant output from the full `dsregcmd` result were not copied into the public record.

Edge opened to its first-run confirmation screen, which indicated organization-enforced sync. The confirmation was not accepted, so `edge://policy` and a device-side Edge setting were **not** verified. The portal's Succeeded report remains a portal observation. Wallpaper, Defender state, and installed-update history were not checked on the desktop.

## Result

**Partially verified.** The existing Enterprise Cloud PC, assigned pilot-user web session, Microsoft Entra device join, Intune management record, and Windows build were observed. No new Cloud PC was created during this check. No sanitized screenshots are published. A policy result on the device, patch history, network path, lifecycle actions, and the remaining pilot gates are still pending. Do not use this record to claim that every Enterprise pilot acceptance gate passed.

## Next checks

1. Complete Edge first-run setup with the tenant owner present, then check `edge://policy` and compare the exact setting with the Intune report.
2. Check wallpaper, Defender and installed update state on the Cloud PC against the portal results.
3. Capture sanitized portal and device screenshots that preserve setting, result, and test date without account or tenant identifiers.
4. Test a separate ANC only if private network routing is required. Lifecycle actions must use a disposable pilot and explicit rollback plan.
