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

## Actual sign-in log

Under **Conditional Access > Sign-in logs**, the pilot user's interactive sign-in at **2026-10-06 3:53:10 PM** in the portal's local display showed **Windows App - Web**, resource **Azure Virtual Desktop**, client app **Browser**, sign-in **Success**, and the main Conditional Access column **Not Applied**. The event's separate **Report-only** tab showed the existing MFA policy with result **Report-only: Success**. [Sanitized portal capture](UC-09-2026-10-06-report-only-result.jpg) shows that policy result without user, IP address, tenant, or event identifiers.

This is one real gateway sign-in result. It does not establish an enforced MFA challenge, full sign-in coverage for Windows 365 and Windows Cloud Login, or safe enforcement of the policy. The policy remains Report-only. A controlled follow-up needs the relevant Windows 365 and optional Windows Cloud Login events, an emergency access exclusion review, and a device or user experience check before enforcement.

## Microsoft Learn checked

- [What If tool](https://learn.microsoft.com/entra/identity/conditional-access/what-if-tool): simulations require identity, target resource, platform, and client app; they do not test service dependencies.
- [Report-only evaluation](https://learn.microsoft.com/entra/identity/conditional-access/concept-conditional-access-report-only): review the Report-only tab separately from enforced Conditional Access.
- [Windows 365 Conditional Access](https://learn.microsoft.com/windows-365/enterprise/set-conditional-access-policies): account for the relevant Windows 365 connection resources.
