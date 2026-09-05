# UC-11: Joiner, Mover, and Leaver Lifecycle

> **Status:** Enterprise lifecycle design complete. Live grace-period and deprovisioning evidence is pending.

## Business requirement

Automate Cloud PC eligibility by persona while preventing orphaned licenses, unexpected data loss, duplicate Cloud PCs, and uncontrolled access during employee lifecycle changes.

## Group model

Use separate groups for:

- Persona eligibility
- Windows 365 license SKU
- Provisioning-policy assignment
- User-scoped applications and settings
- Cloud PC device-scoped policies

Dynamic persona groups can use authoritative attributes such as department, worker type, location, or extension attributes. Attribute quality and HR/identity governance are prerequisites.

Keep the provisioning-policy group separate from the license-SKU group. Windows 365 Enterprise provisions a Cloud PC only when the user has an eligible Windows 365 license and is targeted by a provisioning policy. If several provisioning policies apply to the same license, Windows 365 uses the first assigned policy for that provisioning event. Avoid overlapping assignments. Provisioning-policy assignments don't support nested groups, so add users directly or use a supported dynamic user group.

## Joiner

1. Identity is created and required attributes are populated.
2. User enters the persona eligibility group.
3. License group assigns the correct Windows 365 SKU.
4. Provisioning group assigns the correct policy.
5. Windows 365 provisions the Cloud PC.
6. Intune applies device and user policies.
7. User completes access validation.

Success criteria include provisioned state, correct region/network/image, Intune enrollment, compliance, application availability, and successful connection.

## Mover

A persona change can affect license size, provisioning policy, application entitlements, security controls, network needs, and the existing Cloud PC lifecycle. It must not be treated as a simple attribute edit.

Safe workflow:

1. Determine whether the existing Cloud PC can remain.
2. Determine whether Resize or Move satisfies the new requirement.
3. Prepare target groups and licenses before removing source eligibility.
4. Protect and migrate user data where a new Cloud PC is required.
5. Add target assignments and validate processing.
6. Remove source assignments under change control.
7. Monitor license, grace-period, and Cloud PC status.
8. Validate access and remove stale entitlements.

Choose the operation from the required change:

| Required change | Preferred action | Important limit |
|---|---|---|
| Applications, settings, or access only | Change the relevant groups | Confirm new access before removing the source assignment |
| CPU or memory | Resize | Group-based licensing uses a 48-hour Resize pending license window |
| Supported region, network, or SSO change | Move or apply the current provisioning-policy configuration | The user can be disconnected; validate feature support first |
| Image change on an existing Cloud PC | Reprovision or approved replacement | Reprovision deletes the existing Cloud PC and local data |
| Join-type change | Approved replacement design | Do not present this as an ordinary group change |

Editing a provisioning policy does not automatically update every existing Cloud PC. New and reprovisioned Cloud PCs use the updated configuration. Supported existing-device changes must use the documented apply or Move operation.

## Leaver

1. Block sign-in according to the offboarding standard.
2. Revoke active sessions or refresh tokens where required.
3. Preserve business data according to legal and retention requirements.
4. Record Cloud PC state and ownership.
5. Remove license/eligibility at the approved time.
6. Monitor the seven-day grace period. The user can continue using the Cloud PC during grace unless account access was already blocked. A grace-period Cloud PC still counts as active capacity.
7. Use **End grace period** or **Deprovision now** only with explicit authorization because permanent deletion is intended.
8. Recover the license and confirm stale groups, apps, and access are removed.

## Safe lab

Use a disposable user and test data:

1. Add the user to the source persona and validate provisioning.
2. Add the target license/provisioning assignments without removing the source.
3. Observe group and license processing.
4. Test an approved Resize/Move path where appropriate.
5. Remove the source assignment only after documenting expected grace-period impact.
6. Reassign during grace and confirm recovery where the test plan calls for it.

## Evidence

- Persona rule and sample evaluation
- Separate license and provisioning groups
- Joiner provisioning timeline
- Mover decision record
- Grace-period state and authorized recovery
- Leaver deprovisioning checklist

## Risks and controls

| Risk | Control |
|---|---|
| Attribute error changes group membership | Authoritative source, validation, audit, exception workflow |
| License removed before target is ready | Add/validate target before removing source |
| User receives multiple policies | Clear persona precedence and assignment review |
| Local data is lost | OneDrive/approved data protection and user confirmation |
| Orphaned license continues billing | Scheduled license and Cloud PC reconciliation |

## Skills demonstrated

Identity governance, dynamic groups, licensing, provisioning eligibility, persona migration, grace-period operations, deprovisioning, and lifecycle risk management.

## Rollback

Keep the source license and policy until the target state is ready. During the grace period, restore the license or provisioning-policy assignment that was removed to return the Cloud PC to **Provisioned**. After **Deprovision now**, grace-period expiry, or permanent deprovisioning, the Cloud PC cannot be brought back by group rollback.

Removing a license or provisioning-policy assignment is not the immediate access-control step for a leaver. Disable sign-in and revoke sessions first. Use the grace period only as the Cloud PC lifecycle safety window.

## References

- [Windows 365 provisioning](https://learn.microsoft.com/windows-365/enterprise/provisioning)
- [Create provisioning policies](https://learn.microsoft.com/windows-365/enterprise/create-provisioning-policy)
- [Cloud PC lifecycle](https://learn.microsoft.com/windows-365/enterprise/lifecycle)
- [Cloud PC states and grace period](https://learn.microsoft.com/windows-365/enterprise/device-management-overview)
- [Deprovision or end grace period](https://learn.microsoft.com/windows-365/enterprise/end-grace-period)
- [Resize a Cloud PC](https://learn.microsoft.com/windows-365/enterprise/resize-cloud-pc)
- [Move a Cloud PC](https://learn.microsoft.com/windows-365/enterprise/move-cloud-pc)
- [Edit provisioning policies](https://learn.microsoft.com/windows-365/enterprise/edit-provisioning-policy)
- [Reprovision a Cloud PC](https://learn.microsoft.com/windows-365/enterprise/reprovision-cloud-pc)
