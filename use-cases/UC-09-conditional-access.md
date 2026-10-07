# UC-09: Conditional Access for Windows 365

> **Status:** Enterprise policy inventory, three resource simulations, and a controlled Cloud PC connection with gateway and Windows Cloud Login events observed. Windows 365 resource event and enforcement remain pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/05-identity-sso-conditional-access.svg) · [Edit the source](../architecture/diagrams/source/05-identity-sso-conditional-access.drawio). The diagram separates service access, gateway authentication, and optional Cloud PC single sign-on.

The diagram is a reference design. The [live pilot record](../evidence/UC-09-2026-10-06-conditional-access-validation.md) shows which resources the existing tenant policy actually matches.

## Requirement

Protect Windows 365 access with Microsoft Entra Conditional Access without locking out administrators or interrupting users through an untested policy.

## Earlier Business lab notes

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

## Proposed production pilot configuration

This is an example to build after the current policy's scope and emergency access exclusions are reviewed. It is **not** the name or verified configuration of the existing `windows 365 -test` policy.

| Setting | Value |
|---|---|
| Policy name | `CA-W365-Pilot-Require-MFA` |
| Included users | Windows 365 pilot user or pilot group |
| Excluded users | Emergency access accounts |
| Target resources | Relevant Windows 365 resource apps |
| Grant control | Require multifactor authentication |
| Policy state | Report-only |

A separate policy named `CA-W365-Pilot-Require-Compliant-Device` can be tested after the intended connecting device consistently reports Compliant in Intune.

## Repeat the Enterprise lab

1. Record the existing policy state, included pilot identity, target resources, grant control, and emergency access exclusions. Keep the policy in **Report-only**.
2. In **Entra ID > Conditional Access > Policies > What if**, select the pilot user, the connecting device platform, and the client app. Run separate simulations for **Windows 365**, **Azure Virtual Desktop**, and **Windows Cloud Login** when single sign-on is in scope. Record the policy name, whether it applies, and any reason it does not.
3. Start a controlled Cloud PC connection. In **Conditional Access > Sign-in logs**, filter by the pilot user and a narrow time range. Open each relevant event and record application, resource, client app, sign-in status, the enforced Conditional Access result, and the separate **Report-only** result.
4. Compare the actual sign-in events with the simulations. A simulation does not prove that a prompt occurred. A report-only success does not prove that the policy enforced MFA.
5. Review exclusions and rollback before considering a separate enforcement test. Do not enable the existing policy just to complete the lab.

One Cloud PC launch can create separate sign-in events for Windows 365, gateway access, and Windows Cloud Login when SSO is enabled. Validation must not rely on one event only.

## Observed Enterprise result

The [initial Enterprise review](../evidence/UC-09-2026-09-24-conditional-access-review.md) found one report-only MFA policy and zero sign-ins in its earlier seven-day impact pane. The [2026-10-06 live validation](../evidence/UC-09-2026-10-06-conditional-access-validation.md) records What If results, policy scope with zero excluded identities, and a controlled connection that reached the existing Cloud PC desktop. The interactive logs show Azure Virtual Desktop success, a Windows Cloud Login consent failure `50206`, then Windows Cloud Login success after permission. The sanitized [portal capture](../evidence/UC-09-2026-10-06-report-only-result.jpg) shows an earlier gateway Report-only result. The Windows Cloud Login event's Report-only label differed from its What If prediction; this discrepancy remains open. None of these results proves that MFA was enforced.

## Evidence

See the [policy inventory](../evidence/UC-09-2026-09-24-conditional-access-review.md) and [new live validation](../evidence/UC-09-2026-10-06-conditional-access-validation.md). The older zero-sign-in pane was a time-bound snapshot; the later gateway event supplies a matching report-only result.

Verified in the dated record: three What If resource tests, policy scope, a Cloud PC desktop connection, Azure Virtual Desktop and Windows Cloud Login sign-ins, and a consent failure followed by success.

The following evidence remains before an end-to-end claim:

- Emergency-account exclusion and recovery plan (the existing policy has zero excluded identities)
- Windows 365 sign-in event
- Explanation of the Windows Cloud Login What If and live-event difference
- A separate, approved enforcement test after recovery controls are ready

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
