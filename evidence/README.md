# Test evidence and open checks

A [dated Enterprise pilot check](UC-02-2026-09-24-portal-check.md) records the existing Cloud PC state, pilot-user web session, and sanitized join/build command results observed on 2026-09-24. The [security, app, update, and restore check](UC-06-07-08-10-2026-09-24-pilot-check.md) adds three cropped screenshots and explicit limits. No public screenshot of the provisioning page or full device identity is published. The Business lab activities below were reported during the project, but a reviewer cannot verify them from this repository. Enterprise procedures are design and test instructions until a dated result is added. Do not use a written procedure as proof that a tenant change succeeded.

| Use case | Current record | Next result to publish |
|---|---|---|
| UC-01 Tenant readiness | [License inventory](UC-01-03-13-2026-09-24-capacity-review.md) and cropped screenshot: Enterprise 1 assigned, 0 available | Assignee, role, service plan, and isolated pilot scope |
| UC-02 Enterprise provisioning | [Existing Enterprise portal check](UC-02-2026-09-24-portal-check.md): Provisioned, user session, Intune record, and join output observed | Sanitized screenshots, device policy and update results |
| UC-03 Networking | [ANC inventory](UC-01-03-13-2026-09-24-capacity-review.md): 0 configured; existing web session connected | ANC health, subnet, DNS, route, and endpoint checks |
| UC-04 Intune inventory | Enterprise device Overview and check-in observed in UC-02 portal check | Sanitized screenshots and enrollment details |
| UC-05 Configuration | [Enterprise portal report](UC-02-2026-09-24-portal-check.md): Edge and wallpaper Succeeded | Exact setting on device and sanitized screenshot |
| UC-06 Security and compliance | [Six Intune rule results](UC-06-07-08-10-2026-09-24-pilot-check.md) and [current device-side security screens](UC-06-2026-09-24-device-security-check.md) | Diagnose Windows Security warnings, fresh policy source, BitLocker separately |
| UC-07 Applications | [Two Required apps Installed](UC-06-07-08-10-2026-09-24-pilot-check.md) with cropped image | Available, Uninstall and launch results |
| UC-08 Windows servicing | [Installed updates and current build](UC-06-07-08-10-2026-09-24-pilot-check.md) with cropped image | Controlled ring and restart result |
| UC-09 Conditional Access | [Policy inventory and impact review](UC-09-2026-09-24-conditional-access-review.md): one report-only policy, zero matching sign-ins in seven days | Scoped pilot event, What If and report-only result |
| UC-10 Cloud PC actions | [Automatic restore points listed](UC-06-07-08-10-2026-09-24-pilot-check.md); no action run | Action report and before/after for each action |
| UC-11 User lifecycle | Procedure only | Joiner, mover, grace-period, recovery test |
| UC-12 Troubleshooting | [Enterprise monitoring snapshot](UC-12-2026-09-24-monitoring-check.md) and [connection retry](UC-02-2026-09-24-portal-check.md); no root cause claimed | One complete sanitized incident record |
| UC-13 Image baseline | [Image inventory](UC-01-03-13-2026-09-24-capacity-review.md): supported gallery image in existing policy; 0 custom images | Image validation and new pilot Cloud PC |
| UC-14 Admin and LAPS | Procedure only | Policy status, local group check, protected LAPS test |
| UC-15 Production rollout | Design only | Ring, cost, performance, media and support handoff results |

## Record a test

Copy this format into a dated Markdown file named `UC-XX-YYYY-MM-DD-test.md` in this folder. Replace placeholders with observed results; do not pre-fill a successful outcome.

```text
# UC-XX: Test title
Date and time (UTC):
Environment and edition: Windows 365 Business / Enterprise
Pilot scope: sanitized group and device alias
Change owner and change reference:
Microsoft Learn article and review date:
Preconditions:
Action performed:
Expected result:
Observed result:
Portal evidence: relative links to sanitized screenshots
Device evidence: sanitized commands, output, or event IDs
User experience:
Failure and troubleshooting, if any:
Rollback performed or rollback readiness:
Conclusion: Passed / Failed / Blocked
```

A `Passed` conclusion needs both the service-side result and a device or user-side check where applicable. A `Blocked` conclusion must state the missing license, permission, tenant access, or test environment. Link the new record from the matching use case and update its status only after review.

## Before publishing a screenshot

- Keep the original outside the public repository.
- Remove tenant names, email addresses, IDs, IP addresses, billing data, QR codes, tokens, and recovery keys.
- Show the setting, assignment, result, and relevant date without hiding the information that proves the claim.
- Add a one-sentence caption that says what the screenshot confirms.
- Follow the [evidence standard](../docs/evidence-standard.md).
