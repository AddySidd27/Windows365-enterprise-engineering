# UC-02: Existing Enterprise Cloud PC portal check

Date (UTC): 2026-09-24
Environment and edition: Windows 365 Enterprise, dedicated Cloud PC
Scope: one existing Cloud PC and its assigned pilot user; identifiers withheld
Method: signed-in Microsoft Intune admin center, read-only inspection of All Cloud PCs, device Overview, Device configuration, and provisioning policy Properties. This was not a new provisioning run.

| Check | Observed in portal | Limit |
|---|---|---|
| Cloud PC count and state | One record; **Provisioned**; zero failed and zero provisioning | State at time of inspection, not end-to-end provisioning trace |
| Provisioning policy | Enterprise license type; full Cloud PC desktop; Microsoft Entra Join; single sign-on enabled; gallery image Windows 11 Enterprise + Microsoft 365 Apps 25H2; English (United States) | Network geography/region was not established from this view |
| Cloud PC size | Enterprise 2 vCPU, 4 GB RAM, 64 GB storage | Performance and user experience not tested |
| Intune record | Corporate ownership, primary user populated, compliant, last check-in shown on 2026-09-24 | Device-side join output and compliance rule details not inspected |
| Configuration reports | Edge settings catalog, wallpaper settings catalog, Defender Antivirus, and pilot update policy showed **Succeeded** for this Cloud PC | Portal status alone does not prove the visible Edge setting, wallpaper, antivirus state, or installed update on the device |

## Result

**Partially verified.** An existing Enterprise Cloud PC and Intune management record are visible in the tenant. The provisioning policy and several device configuration reports are visible. No new Cloud PC was created during this check. A connected pilot-user session, `dsregcmd /status`, device-side policy checks, update result, and sanitized screenshot evidence remain pending. Do not use this record to claim that every Enterprise pilot acceptance gate passed.

## Next checks

1. Connect as the assigned pilot user through Windows App or web; record the desktop result.
2. On the Cloud PC, verify join and tenant with `dsregcmd /status`, then redact IDs before publication.
3. Check `edge://policy`, wallpaper, Defender and update state on the Cloud PC against the portal results.
4. Capture sanitized portal and device screenshots that preserve setting, result, and test date without account or tenant identifiers.
5. Test a separate ANC only if private network routing is required. Lifecycle actions must use a disposable pilot and explicit rollback plan.
