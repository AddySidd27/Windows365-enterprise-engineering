# UC-05: Enterprise Edge policy portal review

**Observed:** 2026-10-04 Pacific time. Read-only review in Intune and Windows 365 Enterprise. No policy assignment or device setting was changed.

## Scope and result

The Windows 365 **All Cloud PCs** view showed one Provisioned Enterprise Cloud PC using the `Windows 365 -Enterprise` provisioning policy and Microsoft-hosted Cloud PC network.

In **Devices > Configuration**, the existing settings catalog profile `WIndows 365 - Edge Policy` showed two successful check-ins and no errors or conflicts. Its device report listed the Enterprise Cloud PC as **Success**, with last report modification displayed as 2026-09-24 07:22:09 in the portal's displayed time zone. The per-device settings report showed **Succeeded** for both **Action to take on Microsoft Edge startup** and **Configure the home page URL**.

The profile's configuration pane showed `Home page URL (Device)` set to `https://learn.microsoft.com/windows-365/`, two entries for **Action to take on Microsoft Edge startup** displayed as **Disabled**, and **Configure the home page URL** displayed as **Enabled**. The included group is named `WIndows 365 - Busniess`. The group name alone is not evidence of edition targeting; the device report and Cloud PC inventory independently identify the Enterprise device.

## Limits and next test

The 2026-10-04 review was service-side reporting. Its data may be delayed. The device-side follow-up below supersedes the earlier access limitation. Home-button behavior, startup behavior, and a conflict scenario remain untested.

## Controlled device-side follow-up: 2026-10-06 Pacific time

Connected to the existing Enterprise Cloud PC in Windows App web client and opened Microsoft Edge `edge://policy`. The effective policy list showed `HomepageLocation` with `https://learn.microsoft.com/windows-365/`, source **Platform**, applies to **Device**, level **Mandatory**, status **OK**. This matches the home page URL configured in the Intune profile reviewed above.

The same list showed `BrowserSignin` (2) and `ForceSync` (true) as mandatory current-user policies, plus recommended current-user sleeping-tab and startup-boost policies. Their presence does not attribute them to the reviewed Edge profile. **No startup-action policy appeared in the visible effective policy list**, despite the Intune per-setting report showing Succeeded for an action setting. The portal result and browser result therefore do not establish an effective startup behavior. Policy precedence displayed no policies set.

This check verifies the home page policy value on the Enterprise device, not that the Home button is displayed or that the URL opens at startup. A follow-up should compare the exact startup setting name and scope in Intune with Edge's effective policy and test a fresh browser launch. Do not call the whole profile validated from the two portal success counts.

### After-restart browser check: 2026-10-07 Pacific time

After the [controlled Cloud PC restart](UC-10-2026-10-07-controlled-restart.md), opened Microsoft Edge from the desktop. It opened a **New tab** page, not the configured home page URL. `edge://policy` still showed `HomepageLocation` with the configured URL, Platform / Device / Mandatory / OK. The visible effective policy list still did not show a startup-action policy. The earlier Edge settings page displayed **Open the new tab page** selected under On startup and the **Show home button on the toolbar** switch off. These observations distinguish the configured home page value from current startup and Home button behavior. The Intune startup-action result still needs exact setting and scope reconciliation; no conflict remediation was performed.
