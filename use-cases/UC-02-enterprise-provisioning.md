# UC-02: Windows 365 Enterprise Provisioning

> **Status:** An existing Enterprise Cloud PC and its Intune record were observed in a [read-only portal check](../evidence/UC-02-2026-09-24-portal-check.md). New provisioning, user sign-in, and device-side tests remain pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/07-provisioning-lifecycle.svg) · [Edit the source](../architecture/diagrams/source/07-provisioning-lifecycle.drawio). Follow the service checks from license and user-group assignment to an available Cloud PC.

## Business requirement

Provision a persistent, Microsoft Entra joined Cloud PC for a pilot user using a controlled policy, supported image, and Microsoft-hosted network.

## Design decision

The first pilot uses Microsoft Entra Join and a Microsoft-hosted network. The user needs internet and SaaS access but does not need a private customer network. The user's Windows 365 license sets the Cloud PC size. The provisioning policy does not set the size.

## Implementation

1. Open **Microsoft Intune admin center > Devices > Provision Cloud PCs > Provisioning policies**.
2. Create `W365-ENT-PP-MHN-Pilot`.
3. Select **Access a full Cloud PC desktop** as the experience type.
4. Select **Enterprise** as the license type.
5. Select **Microsoft Entra Join**.
6. Select **Microsoft-hosted network**, then choose a geography and region strategy that meets residency, resiliency, and latency requirements. Use all default regions in the geography unless a documented requirement needs narrower placement.
7. Enable Microsoft Entra single sign-on for the pilot when its authentication prerequisites are satisfied.
8. Select a supported Windows 11 Enterprise gallery image.
9. Configure language and region settings.
10. Assign `W365-ENT-Pilot-Provisioning`.
11. Create the policy and monitor **Devices > Provision Cloud PCs > All Cloud PCs**.

## Expected provisioning chain

1. The licensing group gives the user a Windows 365 Enterprise SKU.
2. The provisioning group makes the user eligible for the provisioning policy.
3. Windows 365 confirms the user has both the required license and provisioning-policy eligibility.
4. Windows 365 allocates Azure capacity and creates the VM from the specifications in the user's license.
5. Windows 365 creates the NIC and connects it to the Microsoft-hosted network selected by the policy.
6. The device joins Microsoft Entra ID.
7. The Cloud PC enrolls into Microsoft Intune without requiring the user's credentials.
8. Windows 365 sets the assigned user as the Intune primary user.
9. Windows 365 applies its post-provisioning Cloud PC optimizations.
10. Windows 365 assigns the completed Cloud PC to the user.
11. The user receives the Cloud PC in Windows App and the Windows 365 web portal.

## Validation

On the Cloud PC, run:

```powershell
hostname
dsregcmd /status
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsBuildNumber
```

Confirm:

- `AzureAdJoined : YES`
- Correct tenant identity
- Expected Windows edition and build
- Cloud PC status is **Provisioned**
- Device exists in Microsoft Intune
- User can connect through Windows App or web

## Evidence

- Provisioning-policy summary and assignment
- Cloud PC `Provisioned` status
- Sanitized `dsregcmd /status` identity section
- Windows App resource listing

## Troubleshooting

| Failure | Investigation |
|---|---|
| User remains unlicensed | Validate usage location, license availability, and group-based licensing processing |
| No provisioning starts | Confirm both license and provisioning-policy eligibility |
| Provisioning fails | Open the Cloud PC provisioning error and correlate the error code with the provisioning report |
| User cannot see the resource | Confirm user identity, license, provisioning status, and Windows 365 resource discovery sign-in |
| SSO fails | Validate provisioning-policy SSO, client support, Conditional Access, and Windows Cloud Login sign-ins |

## Rollback

Remove the pilot from the provisioning assignment only when the lifecycle impact is understood. License removal starts a grace period and can eventually deprovision the Cloud PC.

## References

- [Provisioning in Windows 365](https://learn.microsoft.com/windows-365/enterprise/provisioning)
- [Create provisioning policies](https://learn.microsoft.com/windows-365/enterprise/create-provisioning-policy)
- [Automated provisioning steps](https://learn.microsoft.com/windows-365/enterprise/automated-provisioning-steps)
- [Windows 365 architecture](https://learn.microsoft.com/windows-365/enterprise/architecture)
