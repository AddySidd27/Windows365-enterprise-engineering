# UC-10: Controlled Enterprise Cloud PC restart

**Observed:** 2026-10-07 Pacific time. Existing Windows 365 Enterprise Cloud PC on the Microsoft-hosted network. One restart through Windows App web client; no resize, move, restore, or reprovision.

## Method and observations

1. Connected to the existing Cloud PC. Before the action, Microsoft Whiteboard had been launched for the [UC-07 check](UC-07-2026-09-24-company-portal-check.md), but no board was created. No new lab file or unsaved document was being edited.
2. In Windows App **Devices**, selected the Enterprise Cloud PC's **More options > Restart**. The confirmation warned that unsaved changes might be lost and the Cloud PC would be unavailable until restart finished. Confirmed the action.
3. The device card showed **Restarting**. The active remote session displayed **Remote PC is shutting down** and disconnected.
4. After the **Restarting** indicator cleared, the card offered **Connect** again. Opened a fresh web session. Windows completed sign-in and displayed the same managed desktop wallpaper.
5. Microsoft Edge launched from the desktop. It opened a **New tab** page. `edge://policy` still showed `HomepageLocation` as `https://learn.microsoft.com/windows-365/`, source **Platform**, applies to **Device**, level **Mandatory**, status **OK**. The visible policy list still had no startup-action policy. This supports the [UC-05 device comparison](UC-05-2026-10-04-edge-policy-review.md) after a reboot.

## Result and limits

**Restart and user reconnect passed** for this one Cloud PC. The observed shutdown, temporary unavailable state, return of Connect, signed-in desktop, and Edge policy check establish the controlled reboot path. The Microsoft-hosted network placement was not changed. No user data restoration, Intune post-restart check-in timestamp, Cloud PC actions report, or application installation status was reviewed in this check. A separate device and service-side post-action review is needed before calling all management checks complete.
