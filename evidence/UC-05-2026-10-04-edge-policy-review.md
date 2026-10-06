# UC-05: Enterprise Edge policy portal review

**Observed:** 2026-10-04 Pacific time. Read-only review in Intune and Windows 365 Enterprise. No policy assignment or device setting was changed.

## Scope and result

The Windows 365 **All Cloud PCs** view showed one Provisioned Enterprise Cloud PC, `CPC-windo-BN4T7`, using the `Windows 365 -Enterprise` provisioning policy and Microsoft-hosted Cloud PC network.

In **Devices > Configuration**, the existing settings catalog profile `WIndows 365 - Edge Policy` showed two successful check-ins and no errors or conflicts. Its device report listed `CPC-windo-BN4T7` as **Success**, with last report modification displayed as 2026-09-24 07:22:09 in the portal's displayed time zone. The per-device settings report showed **Succeeded** for both **Action to take on Microsoft Edge startup** and **Configure the home page URL**.

The profile's configuration pane showed `Home page URL (Device)` set to `https://learn.microsoft.com/windows-365/`, two entries for **Action to take on Microsoft Edge startup** displayed as **Disabled**, and **Configure the home page URL** displayed as **Enabled**. The included group is named `WIndows 365 - Busniess`. The group name alone is not evidence of edition targeting; the device report and Cloud PC inventory independently identify the Enterprise device.

## Limits and next test

This is service-side policy reporting, not a fresh device-side `edge://policy` check. The report warns that its data may be delayed. No browser launch, home-button behavior, conflict scenario, or comparison against the actual browser value was verified in this review. The Cloud PC web session could not be inspected in the current browser because opening its remote-session tab returned a browser protocol error. Keep UC-05 partially validated until a device-side check records the effective values and browser behavior.
