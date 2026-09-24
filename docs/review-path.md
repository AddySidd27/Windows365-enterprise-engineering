# Review path and release gates

This page gives a technical reviewer a short route through the project. It also lists what must be measured before the repository can claim a complete Enterprise deployment.

## Review the design

1. Read the [README](../README.md), [fundamentals](01-fundamentals.md), and [learning path](03-learning-path.md) for the deployment order and edition boundary.
2. Compare [Microsoft-hosted networking](../architecture/diagrams/exported/02-microsoft-hosted-network.svg), [Entra join with ANC](../architecture/diagrams/exported/03-entra-join-azure-network-connection.svg), and [hybrid join with ANC](../architecture/diagrams/exported/04-hybrid-join-azure-network-connection.svg). Open the matching `.drawio` source to inspect or edit the design.
3. Read [UC-03](../use-cases/UC-03-network-architecture.md) for the network choice, [UC-13](../use-cases/UC-13-image-and-application-baseline.md) for the image decision, and [UC-02](../use-cases/UC-02-enterprise-provisioning.md) for the first Cloud PC.
4. Follow [UC-05](../use-cases/UC-05-configuration-management.md), [UC-06](../use-cases/UC-06-endpoint-security-and-compliance.md), [UC-07](../use-cases/UC-07-application-lifecycle.md), [UC-08](../use-cases/UC-08-windows-servicing.md), and [UC-09](../use-cases/UC-09-conditional-access.md) for day-two controls.
5. Check [UC-10](../use-cases/UC-10-cloud-pc-lifecycle-operations.md), [UC-12](../use-cases/UC-12-monitoring-and-troubleshooting.md), and the [evidence index](../evidence/README.md) for operational limits and observed results.

## Enterprise pilot acceptance

| Gate | Result needed | Evidence |
|---|---|---|
| Tenant | Correct license, Intune entitlement, roles, pilot users | Sanitized license and role views |
| Network | Hosted region selected or ANC health passes; private resource and service endpoints reachable | Diagram, health result, DNS and route checks |
| Provisioning | One Cloud PC reaches Provisioned for the expected user, size, image, join, and network | Policy and Cloud PC record |
| Management | Entra device and Intune record exist; primary user and check-in are correct | Device record and sanitized `dsregcmd` output |
| Configuration | Edge and one visible desktop setting apply without conflict | Per-setting result and device-side check |
| Apps | Required and Available installs work; one supported Uninstall test succeeds | Intune install states and user result |
| Servicing | Pilot update ring applies; update and restart behavior match policy | Before/after build and update report |
| Security | Defender and Firewall settings report success; compliance evaluation is complete | Per-setting report and local state |
| Access | Report-only Conditional Access results match each relevant resource event | What If and sign-in-log result |
| Operations | Restart and at least one approved lifecycle action are monitored end to end | Action report, user data and post-action checks |
| Support | One failed condition is traced from symptom through root cause and recovery | Sanitized incident record |

A [dated pilot check](../evidence/UC-02-2026-09-24-portal-check.md) confirms an existing Provisioned Cloud PC, pilot-user connection, Microsoft Entra join, and parts of the management gate. A [follow-up check](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md) adds six compliance states, two installed app reports, update history, restore inventory, and three cropped screenshots. Other gates remain unverified. This table is a test plan, not a claim that the pilot passed. The Enterprise pilot cannot be declared complete from Business edition screenshots.

## Publication checks

- `bash scripts/validation/validate-repository.sh` passes.
- The editable draw.io source and SVG/PNG export of each changed diagram show the same labels and boundaries.
- Every new product claim links to a relevant Microsoft Learn page.
- The use-case status, evidence index, and test record agree.
- Public screenshots have been sanitized and remain legible.
