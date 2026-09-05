# UC-05: Configuration Management and Policy Conflict Resolution

> **Status:** Edge policy, policy conflict removal, and managed wallpaper were tested in the Business lab. Evidence is pending sanitization.

## Business requirement

Apply consistent browser and desktop configuration to Cloud PCs while keeping policy ownership, assignment, reporting, and troubleshooting simple.

## Design

Configuration is separated by workload:

- `W365-ENT-CONFIG-Edge-Pilot` for Microsoft Edge settings
- `W365-ENT-CONFIG-Desktop-Pilot` for visible Windows user-experience settings
- Endpoint security settings remain in Endpoint security policies

Device-scoped settings target `W365-ENT-Pilot-Devices`. User-scoped settings target `W365-ENT-Pilot-Users`. The same setting is not configured in multiple profiles.

## Implementation A: Microsoft Edge

1. Open **Microsoft Intune admin center > Devices > Windows > Configuration > Create > New policy**.
2. Select **Windows 10 and later > Settings catalog**.
3. Name the profile `W365-ENT-CONFIG-Edge-Pilot`.
4. Add only the settings needed for the test:
   - Configure the home page URL
   - Show Home button
   - Define the startup action or startup URLs
   - Disable password-manager use for the pilot, where organizational policy requires it
5. Assign `W365-ENT-Pilot-Devices`.
6. Review the final setting list for duplicate or contradictory values.
7. Create the profile and synchronize the pilot Cloud PC.

## Device validation

1. Restart Microsoft Edge after policy synchronization.
2. Open `edge://policy`.
3. Select **Reload policies**.
4. Confirm each intended policy shows:
   - Correct value
   - Source: Platform
   - Level: Mandatory or Recommended as designed
   - Status: OK
5. Test the Home button and browser-start behavior.

## Implementation B: Managed desktop

1. Create a separate Settings Catalog profile named `W365-ENT-CONFIG-Desktop-Pilot`.
2. Configure one harmless, visible setting such as the desktop image URL.
3. Use an HTTPS image location reachable by the Cloud PC without interactive authentication.
4. Assign the correct device or user group based on the setting scope.
5. Synchronize and confirm the desktop changes and Windows reports that the setting is managed by the organization.

## Reporting validation

For both profiles, inspect:

- Device assignment status
- User status
- Per-setting status
- Last report modification time

Interpret status carefully:

| Status | Meaning and response |
|---|---|
| Succeeded | Intune received a successful result for the setting |
| Error | Open the setting/device details and correlate the error code |
| Conflict | Find another policy configuring the same CSP/setting |
| Not applicable | Validate OS edition, version, scope, and setting applicability |
| In progress | Confirm recent check-in and allow reporting latency before escalation |

## Conflict troubleshooting workflow

1. Open the affected profile's **Per-setting status**.
2. Identify the exact setting in conflict.
3. Open the affected device and review **Device configuration**.
4. Search Settings Catalog, Administrative Templates, Endpoint security, security baselines, scripts, and GPO for the same setting.
5. Select one policy owner and set the duplicate source to **Not configured**.
6. Synchronize the Cloud PC, reload the application policy, and recheck Intune reporting.

## Evidence

- Profile setting and assignment summaries
- Per-setting success status
- `edge://policy` validation
- Managed desktop result
- Before/after conflict report when demonstrating remediation

## Rollback

Remove the pilot assignment or set the test settings to **Not configured**. Confirm the device receives the revised profile; some settings may require sign-out, restart, or explicit replacement with the desired default.

## Skills demonstrated

Settings Catalog, policy scoping, Edge administration, desktop management, MDM synchronization, reporting, and conflict remediation.

## References

- [Create a Settings Catalog policy](https://learn.microsoft.com/mem/intune/configuration/settings-catalog)
- [Microsoft Edge policy reference](https://learn.microsoft.com/deployedge/microsoft-edge-policies)
