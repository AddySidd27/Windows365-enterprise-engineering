# UC-01: Tenant Readiness and Pilot Design

> **Status:** Enterprise license counts observed and published; assignee, role, service-plan and isolated pilot-group checks pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/01-windows365-enterprise-high-level.svg) · [Edit the source](../architecture/diagrams/source/01-windows365-enterprise-high-level.drawio). This overview shows which parts the customer configures before the first Cloud PC is provisioned.

## Business requirement

Prepare a controlled Windows 365 Enterprise pilot without exposing production users to untested provisioning, security, application, or access policies.

## Design

The recommended pilot design uses a disposable user, a separately available Windows 365 Enterprise license, separate assignment groups, and least-privilege administrative roles. The [observed tenant inventory](../evidence/UC-01-03-13-2026-09-24-capacity-review.md) has 0 free Enterprise seats, so a second disposable pilot has not been created under this design.

## Prerequisites

- Windows 365 Enterprise license matching the required vCPU, RAM, and storage
- Microsoft Intune entitlement
- Microsoft Entra ID P1 for Conditional Access and dynamic groups
- Windows Enterprise entitlement required by the selected Windows 365 plan
- Windows 365 Administrator and Intune Administrator roles, or equivalent custom roles
- Microsoft Intune configured as the MDM authority

Validate current entitlements against [Windows 365 requirements](https://learn.microsoft.com/windows-365/enterprise/requirements).

## Implementation

1. Create a disposable pilot user such as `w365-pilot@contoso.com`.
2. Create assigned security groups:
   - `W365-ENT-Pilot-Licensing`
   - `W365-ENT-Pilot-Provisioning`
   - `W365-ENT-Pilot-Users`
   - `W365-ENT-Pilot-Devices`
3. Assign the Windows 365 Enterprise license to the licensing group.
4. Add the pilot user to the licensing, provisioning, and user-policy groups.
5. Confirm Microsoft Intune MDM authority under Tenant administration.
6. Confirm the administrator has only the roles needed for the lab.
7. Record the intended license SKU, join type, network type, image, region, and rollback owner.

## Validation

- Pilot user shows the expected Windows 365 Enterprise service plan.
- Group membership is direct and easy to reverse.
- No production users are members.
- MDM authority reports Microsoft Intune.
- An emergency administrator account exists and is not used for routine work.

## Evidence

- [Dated license inventory and sanitized product-count screenshot](../evidence/UC-01-03-13-2026-09-24-capacity-review.md)
- Sanitized user license page
- Group membership and assignment pages
- MDM authority page
- Role assignment page

## Common failures

| Symptom | Check |
|---|---|
| User is not eligible for a Cloud PC | License service plan, group processing, usage location |
| Provisioning policy cannot be assigned | Group type, admin role, policy assignment |
| Device never appears in Intune | MDM authority, entitlement, provisioning state |
| Portal blades are unavailable | Tenant selection, role activation, license prerequisites |

## Rollback

Remove only the pilot user from the pilot groups. Do not remove a production user's license as a casual test; license removal can start the Cloud PC grace-period lifecycle.

## References

- [Windows 365 Enterprise requirements](https://learn.microsoft.com/windows-365/enterprise/requirements)
- [Windows 365 Enterprise roles](https://learn.microsoft.com/windows-365/enterprise/role-based-access)
