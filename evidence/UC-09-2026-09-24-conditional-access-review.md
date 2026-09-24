# UC-09: Conditional Access policy inventory and impact check

Date (UTC): 2026-09-24, about 18:24  
Environment: Enterprise pilot tenant  
Method: Read-only Intune admin center Conditional Access overview, policy list, details, and impact pane

The overview showed **0 enabled**, **1 report-only**, and **0 disabled** Conditional Access policies. The single user-created Windows 365 test policy appeared in the list as **Report-only**. Its details showed **one included group**, **no excluded identities**, **two included resources**, **one included client-app category**, no network condition, and **Require multifactor authentication** as the access requirement. Group names, resource names, and identifiers are omitted from the public record.

The policy impact pane displayed **Last 7 days**, **UTC**, and **zero total sign-ins** for that policy. Its success, failure, not-applied, and report-only result categories displayed 0%. The overview separately reported one user signed in without policy coverage and 100% of sign-ins from unmanaged or non-compliant devices in its last-seven-day summary. Those tenant-wide figures do not prove whether the pilot Cloud PC sign-in matched the test policy.

**Conclusion: inventory observed; evaluation pending.** Report-only does not enforce the MFA requirement. A complete pilot test needs an explicit Windows 365 resource and pilot-user scope check, protected emergency access exclusions, What If result, a fresh test sign-in, the corresponding sign-in log and report-only outcome, and a rollback plan before considering enforcement. No policy was changed or enabled during this review. No screenshot is published because the detail pane contained tenant-specific identities and resource names.
