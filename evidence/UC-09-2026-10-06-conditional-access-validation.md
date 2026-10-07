# UC-09: Conditional Access simulation and sign-in result

**Observed:** 2026-10-06 Pacific time in the Microsoft Entra admin center. The existing pilot policy stayed in **Report-only**. No assignment or grant control was changed.

## What If test

In **Conditional Access > Policies > What if**, I selected the existing Enterprise Cloud PC pilot user, device platform **Windows**, and client app **Browser**. I ran the simulation separately for each target resource:

| Target resource | Existing MFA policy result |
|---|---|
| Windows 365 | Will apply; Require multifactor authentication; Report-only |
| Azure Virtual Desktop | Will apply; Require multifactor authentication; Report-only |
| Windows Cloud Login | Will not apply; reason: Cloud apps |

The third result identifies a resource targeting gap if Windows Cloud Login is required for this tenant's single sign-on path. The What If tool evaluates the selected conditions; it does not perform a user sign-in or prove that an MFA prompt occurred.

## Policy scope checked later on 2026-10-06

The live **windows 365 -test** policy details showed **Report-only**, one included group, **0 excluded users, 0 excluded groups, and 0 excluded roles**, and **Require multifactor authentication**. The included resources were **Windows 365** and **Azure Virtual Desktop**. The policy did not include Windows Cloud Login. No policy setting was changed during this review.

An emergency access exclusion has **not** been configured on this policy. Do not turn it On until the intended pilot group, emergency access accounts, and recovery path have been reviewed and the relevant sign-in stages have been tested. This observation makes the exclusion a confirmed configuration gap rather than an unverified checklist item.

## Actual sign-in log

Under **Conditional Access > Sign-in logs**, the pilot user's interactive sign-in at **2026-10-06 3:53:10 PM** in the portal's local display showed **Windows App - Web**, resource **Azure Virtual Desktop**, client app **Browser**, sign-in **Success**, and the main Conditional Access column **Not Applied**. The event's separate **Report-only** tab showed the existing MFA policy with result **Report-only: Success**. [Sanitized portal capture](UC-09-2026-10-06-report-only-result.jpg) shows that policy result without user, IP address, tenant, or event identifiers.

This is one real gateway sign-in result. It does not establish an enforced MFA challenge, full sign-in coverage for Windows 365 and Windows Cloud Login, or safe enforcement of the policy. The policy remains Report-only. A controlled follow-up needs the relevant Windows 365 and optional Windows Cloud Login events, an emergency access exclusion and recovery plan, and a device or user experience check before enforcement.

## Controlled connection follow-up, 2026-10-06 evening

I opened the existing Enterprise Cloud PC through Windows App on the web. The first web-client request returned HTTP 502; a single reload reached the connection settings. After **Connect**, the web client requested permission to sign in to the Cloud PC. The remote Windows desktop and Edge were visible after the sign-in flow. This was the existing Microsoft-hosted Cloud PC; no provisioning, move, or policy change was made.

In the pilot user's **interactive** Entra sign-in logs, with dates shown as Local, I correlated these records with the connection attempt:

| Portal time on 2026-10-06 | Resource | Result | Conditional Access observation |
|---|---|---|---|
| 10:29:12 PM | Azure Virtual Desktop | Success | Main column Not Applied; existing MFA policy Report-only: Success |
| 10:31:35 PM | Windows Cloud Login | Failure, code `50206` | User or administrator had not consented to connect to the target device; main column Not Applied |
| 10:32:22 PM | Windows Cloud Login | Success after the interactive device permission flow | Main column Not Applied; existing MFA policy Report-only: Success; sign-in details say MFA requirement satisfied by a claim in the token |

The two Windows Cloud Login records share a correlation ID in the portal. The successful event confirms that this SSO resource was used in this connection. Its Report-only: Success label and token claim do **not** prove that this Report-only policy enforced an MFA prompt. The earlier What If simulation said the policy would not apply to Windows Cloud Login because of Cloud apps, while the event's Report-only tab displayed Success. Record both observations; do not treat the simulation as a substitute for the live event or claim the discrepancy is resolved. A separate Windows 365 resource sign-in event was not established in this review.



## Microsoft Learn checked

- [What If tool](https://learn.microsoft.com/entra/identity/conditional-access/what-if-tool): simulations require identity, target resource, platform, and client app; they do not test service dependencies.
- [Report-only evaluation](https://learn.microsoft.com/entra/identity/conditional-access/concept-conditional-access-report-only): review the Report-only tab separately from enforced Conditional Access.
- [Windows 365 Conditional Access](https://learn.microsoft.com/windows-365/enterprise/set-conditional-access-policies): account for the relevant Windows 365 connection resources.
