# UC-07: Application Delivery and Removal

> **Status:** Company Portal and Store app install/uninstall were tested in the Business lab. Win32 packaging evidence is still required.

## Business requirement

Demonstrate centrally managed application installation, user self-service, uninstall enforcement, and reporting on a Windows 365 Enterprise Cloud PC.

## Assignment design

| Intent | Target | Use |
|---|---|---|
| Required | Pilot device group | Application must install automatically on the Cloud PC |
| Available for enrolled devices | Pilot user group | User installs from Company Portal |
| Uninstall | Matching pilot group | Intune removes a previously detected application |

Required and Uninstall assignments must not target the same device through overlapping groups.

## Scenario A: Company Portal as Required

1. Open **Microsoft Intune admin center > Apps > All apps > Create**.
2. Select **Microsoft Store app (new)**.
3. Search for and select **Company Portal**.
4. Review publisher, package identifier, installer type, and install behavior.
5. Assign **Required** to `W365-ENT-Pilot-Devices`.
6. Synchronize the Cloud PC and monitor **Device install status**.
7. Confirm Company Portal appears in Start and recognizes the enrolled Cloud PC.

## Scenario B: Available application

1. Add a harmless Store application such as Microsoft Whiteboard.
2. Assign **Available for enrolled devices** to `W365-ENT-Pilot-Users`.
3. Open Company Portal on the Cloud PC.
4. Locate and install the application.
5. Confirm the application launches and Intune reports the user-driven installation.

## Scenario C: Uninstall enforcement

1. Confirm the selected test application is installed and visible in Intune reporting.
2. Remove Required or Available assignments that would reinstall it.
3. Assign the same app as **Uninstall** to the pilot device or user group according to its supported context.
4. Synchronize the Cloud PC.
5. Confirm Intune reports removal and the application is no longer present.

Intune can remove a manually installed app only when it can detect the app and run a supported uninstall command. Store app behavior also depends on the package identity and install context.

## Optional Win32 validation

For an enterprise packaging demonstration:

1. Package a harmless installer as `.intunewin`.
2. Define silent install and uninstall commands.
3. Select System or User install behavior intentionally.
4. Create a reliable detection rule.
5. Define requirement rules.
6. Assign only to the pilot.
7. Validate Intune Management Extension logs.

Useful log location:

```text
C:\ProgramData\Microsoft\IntuneManagementExtension\Logs
```

Primary logs include `IntuneManagementExtension.log`, `AppWorkload.log`, and `AppActionProcessor.log` depending on the current agent version and workflow.

## Validation commands

```powershell
Get-AppxPackage -AllUsers | Select-Object Name, PackageFullName
Get-ChildItem 'C:\Program Files' | Select-Object Name
Get-ChildItem 'C:\Program Files (x86)' | Select-Object Name
```

Use application-specific registry or file detection rather than treating these broad listings as formal detection rules.

## Evidence

- App definition and assignments
- Required installation status
- Company Portal available-app listing
- User-driven install result
- Uninstall status and device-side absence

## Troubleshooting

| Symptom | Check |
|---|---|
| App not visible in Company Portal | User assignment, enrollment, filters, application availability, Company Portal sync |
| Required app does not install | Device assignment, applicability, install context, dependencies, detection |
| App repeatedly reinstalls | Detection rule does not match installed state |
| Uninstall reports failure | Uninstall command/context, running processes, package identity, return code |
| Manual app remains installed | Intune detection or supported uninstall path is missing |

## Rollback

Remove test assignments and return the application to its approved production intent. Do not use business-critical software for install/uninstall demonstrations.

## Skills demonstrated

Microsoft Store app deployment, Company Portal, assignment intent, self-service delivery, uninstall enforcement, Win32 packaging concepts, detection, and application troubleshooting.

## References

- [Microsoft Store apps in Intune](https://learn.microsoft.com/intune/app-management/deployment/add-microsoft-store)
- [Win32 app management in Intune](https://learn.microsoft.com/intune/app-management/deployment/win32)
- [Assign apps to groups](https://learn.microsoft.com/intune/app-management/deployment/assign-groups)
- [Add Company Portal to Intune](https://learn.microsoft.com/mem/intune/apps/store-apps-company-portal-autopilot)
