# UC-02: Enterprise policy and Cloud PC inventory

Date: 2026-10-12 UTC
Environment: Windows 365 Enterprise pilot, Microsoft Intune admin center
Scope: read-only portal review; user and device identifiers omitted

## Action

Opened **Devices > Provision Cloud PCs > Provisioning policies** and reviewed the existing Enterprise policy. Then opened **Devices > All Cloud PCs** to compare the current inventory.

## Observed

- One existing Enterprise policy was assigned. Its properties showed **Microsoft Entra Join**, Microsoft Entra single sign-on enabled, **US Central** geography, a **Gallery** image labelled **Windows 11 Enterprise + Microsoft 365 Apps 25H2**, and English (United States).
- The All Cloud PCs view showed **one Provisioned** Enterprise Cloud PC, assigned to the pilot user, under that policy. It showed **Cloud PC Enterprise 2vCPU/4GB/64GB** and no Azure network connection in its row. The displayed provisioned date was August 30, 2026.
- The policy's separate **Devices** tab showed zero entries in the action-oriented list during this review. The All Cloud PCs inventory is the basis for the one Provisioned observation. These views should not be presented as identical counts.

## Evidence limit

The live portal contained the full user identifier in the Cloud PC table and signed-in account details in the site header. A public screenshot from this review was not published. Existing sanitized September 24 evidence remains linked from the [provisioning use case](../use-cases/UC-02-enterprise-provisioning.md). This review does not prove when the license was first assigned or reconstruct the original creation wizard, and it is not a new provisioning run.

## Next capture

For a complete, public walkthrough, perform a fresh isolated pilot with a spare eligible Enterprise seat, capture the license assignment, group membership, policy wizard, provisioning status, first session and Intune device check-in. Remove account, tenant and device identifiers while preserving the settings and result. Do not change or reprovision the working Cloud PC solely to make screenshots.

References: [Create a provisioning policy](https://learn.microsoft.com/en-us/windows-365/enterprise/create-provisioning-policy), [Automated provisioning steps](https://learn.microsoft.com/en-us/windows-365/enterprise/automated-provisioning-steps).
