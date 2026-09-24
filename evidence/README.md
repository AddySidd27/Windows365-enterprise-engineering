# Test evidence and open checks

A [dated Enterprise pilot check](UC-02-2026-09-24-portal-check.md) records the existing Cloud PC state, pilot-user web session, and sanitized join/build command results observed on 2026-09-24. No sanitized screenshots are published yet. The Business lab activities below were reported during the project, but a reviewer cannot verify them from this repository. Enterprise procedures are design and test instructions until a dated result is added. Do not use a written procedure as proof that a tenant change succeeded.

| Use case | Current record | Next result to publish |
|---|---|---|
| UC-01 Tenant readiness | Business lab reported; no public proof | Sanitized license, role, and pilot scope record |
| UC-02 Enterprise provisioning | [Existing Enterprise portal check](UC-02-2026-09-24-portal-check.md): Provisioned, user session, Intune record, and join output observed | Sanitized screenshots, device policy and update results |
| UC-03 Networking | Hosted network discussed in Business lab; ANC untested | ANC health, subnet, DNS, route, and endpoint checks |
| UC-04 Intune inventory | Enterprise device Overview and check-in observed in UC-02 portal check | Sanitized screenshots and enrollment details |
| UC-05 Configuration | Edge policy and wallpaper reported | Intune assignment, setting status, `edge://policy` |
| UC-06 Security and compliance | Defender, Firewall, compliance reported | Policy setting result and device state; BitLocker separately |
| UC-07 Applications | Company Portal and Store app workflow reported | Required, Available, and Uninstall results with app status |
| UC-08 Windows servicing | Pilot ring creation reported | Before/after build, update and restart result |
| UC-09 Conditional Access | Report-only policy and logs reported | Applicable resource events, What If, report-only results |
| UC-10 Cloud PC actions | Restart reported | Action report and before/after; other actions separately |
| UC-11 User lifecycle | Procedure only | Joiner, mover, grace-period, recovery test |
| UC-12 Troubleshooting | Partial checks reported | One complete sanitized incident record |
| UC-13 Image baseline | Procedure only | Image validation and new pilot Cloud PC |
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
