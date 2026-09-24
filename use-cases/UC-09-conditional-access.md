# UC-09: Conditional Access for Windows 365

> **Status:** Enterprise policy inventory and impact pane observed; matching pilot sign-in and complete resource-app validation pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/05-identity-sso-conditional-access.svg) · [Edit the source](../architecture/diagrams/source/05-identity-sso-conditional-access.drawio). The diagram separates service access, gateway authentication, and optional Cloud PC single sign-on.

## Requirement

Protect Windows 365 access with Microsoft Entra Conditional Access without locking out administrators or interrupting users through an untested policy.

## Earlier Business lab report

- Created a pilot Conditional Access policy for the Windows 365 test user.
- Reported targeting a Windows 365 resource; the exact included resources still need validation against the live policy.
- Selected multifactor authentication as the grant control.
- Kept the policy in **Report-only** mode.
- Reviewed interactive sign-in events in Microsoft Entra.
- Confirmed the managed lab device compliance state before planning a compliant-device control test.

## Design decisions

- Use a small pilot group before wider assignment.
- Exclude emergency access accounts.
- Test MFA and compliant-device requirements separately so failures are easier to diagnose.
- Apply matching policy intent to the relevant Windows 365 resource apps.
- Review What If and sign-in logs before changing a policy from Report-only to On.

## Windows 365 resource apps

| Resource app | Application ID | Purpose |
|---|---|---|
| Windows 365 | `0af06dc6-e4b5-4f28-818e-e78e62d137a5` | Cloud PC list, portal access, and actions such as Restart |
| Azure Virtual Desktop | `9cdead84-a844-4324-93f2-b2e6bb768d07` | Gateway authentication during the Cloud PC connection |
| Windows Cloud Login | `270efc09-cd0d-444b-a71f-39af4910ec45` | Cloud PC authentication when single sign-on is enabled |

The Azure Virtual Desktop resource name represents the Microsoft-hosted gateway used by the Windows 365 connection. It does not mean that this repository deploys a customer-managed AVD host pool.

## Pilot configuration

| Setting | Value |
|---|---|
| Policy name | `CA-W365-Pilot-Require-MFA` |
| Included users | Windows 365 pilot user or pilot group |
| Excluded users | Emergency access accounts |
| Target resources | Relevant Windows 365 resource apps |
| Grant control | Require multifactor authentication |
| Policy state | Report-only |

A separate policy named `CA-W365-Pilot-Require-Compliant-Device` can be tested after the intended connecting device consistently reports Compliant in Intune.

## Validation performed

1. Signed out of the Windows 365 web experience.
2. Started a new Cloud PC connection.
3. Opened **Microsoft Entra admin center > Monitoring & health > Sign-in logs**.
4. Filtered the log by the Windows 365 pilot user.
5. Reviewed the application, resource, authentication details, device information, and Conditional Access result.
6. Kept enforcement disabled because the complete report-only match across all applicable resource apps was not yet confirmed.

One Cloud PC launch can create separate sign-in events for Windows 365, gateway access, and Windows Cloud Login when SSO is enabled. Validation must not rely on one event only.

## Result

The [dated Enterprise review](../evidence/UC-09-2026-09-24-conditional-access-review.md) confirms that one report-only MFA policy exists, but its impact pane showed zero sign-ins in the selected seven-day period. Earlier Business lab activity was reported without public sign-in logs. Neither resource matching nor an MFA outcome is confirmed by this review.

## Evidence

See the [policy inventory and impact check](../evidence/UC-09-2026-09-24-conditional-access-review.md). Its zero-sign-in result is an open validation gap.

The following evidence is required before publishing this use case as fully tested:

- Policy overview showing pilot scope and Report-only state
- Emergency-account exclusion
- What If result for the pilot user
- Windows 365 sign-in event
- Azure Virtual Desktop gateway sign-in event
- Windows Cloud Login sign-in event when SSO is enabled
- Conditional Access report-only result for each applicable event

## Troubleshooting

| Symptom | Check |
|---|---|
| Policy shows Not applied | User assignment, excluded users, target resource, sign-in type, and policy state |
| Portal opens but connection fails | Compare Windows 365, gateway, and Windows Cloud Login sign-in events |
| MFA prompts repeatedly | Sign-in frequency, cached tokens, and policy mismatch across resource apps |
| Compliant-device check fails | Connecting-device registration, Intune enrollment, compliance state, and client support |
| Report-only policy appears to block | Check Security Defaults and other enabled Conditional Access policies |

## Rollback

If an enabled pilot policy interrupts expected access, use the emergency account to set the policy back to **Report-only** or **Off**. Keep the policy and sign-in evidence for investigation instead of deleting them during the incident.

## References

- [Set Conditional Access policies for Windows 365](https://learn.microsoft.com/windows-365/enterprise/set-conditional-access-policies)
- [Require device compliance with Conditional Access](https://learn.microsoft.com/entra/identity/conditional-access/policy-all-users-device-compliance)
