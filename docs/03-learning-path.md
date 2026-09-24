# Windows 365 Enterprise learning path

Use this order for study and lab work. `UC-XX` is a stable topic identifier, not a deployment sequence. Each topic contains design, implementation, validation, and rollback guidance. A written step is not a completed tenant test; use the [evidence index](../evidence/README.md) to check what has actually been published.

| Stage | Read | Do and verify before moving on |
|---|---|---|
| 0. Understand | [Fundamentals](01-fundamentals.md) | Explain Cloud PC, Intune, license, policy, join, and network in your own words |
| 1. Prepare | [UC-01 tenant and pilot](../use-cases/UC-01-tenant-readiness-and-pilot-design.md) | Confirm eligible disposable user, license, roles, MDM, and isolated groups |
| 2. Design network | [UC-03 hosted and ANC options](../use-cases/UC-03-network-architecture.md) | Record hosted or ANC decision, join type, region, and private access requirement |
| 3. Choose image | [UC-13 gallery and custom image](../use-cases/UC-13-image-and-application-baseline.md) | Choose a gallery image for the first lab; document any reason to customize |
| 4. Provision | [UC-02 provisioning](../use-cases/UC-02-enterprise-provisioning.md) and [guided lab](02-first-cloud-pc-lab.md) | Confirm one Provisioned Cloud PC and a successful user session |
| 5. Confirm management | [UC-04 Intune inventory](../use-cases/UC-04-intune-enrollment-and-inventory.md) | Find the correct Entra and Intune records and device check-in |
| 6. Configure | [UC-05 configuration](../use-cases/UC-05-configuration-management.md) | Confirm one setting in portal report and on the device |
| 7. Deliver apps | [UC-07 applications](../use-cases/UC-07-application-lifecycle.md) | Test Required and Available assignments; then a controlled Uninstall |
| 8. Service Windows | [UC-08 updates](../use-cases/UC-08-windows-servicing.md) | Compare update ring report with build and restart result |
| 9. Secure device | [UC-06 endpoint security](../use-cases/UC-06-endpoint-security-and-compliance.md) and [UC-14 local admin and LAPS](../use-cases/UC-14-local-admin-laps-and-security-baseline.md) | Check Defender, Firewall, compliance, admin group, and supported LAPS policy result |
| 10. Secure access | [UC-09 Conditional Access](../use-cases/UC-09-conditional-access.md) | Start report-only; inspect What If and relevant resource sign-ins before enforcement |
| 11. Support users | [UC-12 monitoring](../use-cases/UC-12-monitoring-and-troubleshooting.md) | Record one symptom, finding, recovery, and user outcome |
| 12. Change a Cloud PC | [UC-10 lifecycle actions](../use-cases/UC-10-cloud-pc-lifecycle-operations.md) | On a disposable pilot, test approved action and post-action checks |
| 13. Manage people | [UC-11 joiner/mover/leaver](../use-cases/UC-11-joiner-mover-leaver.md) | Record group, license, data, and grace-period impact |
| 14. Roll out | [UC-15 production planning](../use-cases/UC-15-production-rollout-cost-and-continuity.md) | Agree pilot gates, rollout rings, support owner, costs, and continuity plan |

## Suggested checkpoints

- **Beginner:** Finish stages 0–5 and the guided lab. You should be able to explain the network choice and demonstrate one working Cloud PC.
- **Operator:** Finish stages 6–11. You should be able to show policy and app outcomes on the device and troubleshoot a failed condition.
- **Architect:** Finish stages 12–14, compare hosted and ANC designs, and justify scope, region, image, security, continuity, and rollback decisions.

## Scope and honest limits

This path teaches the dedicated Windows 365 Enterprise scenario in this repository. It does not claim exhaustive coverage of every Windows 365 offering or feature, and a reader needs their own licensed tenant to reproduce live results. The ANC and hybrid paths require separate infrastructure and checks. Dated Enterprise observations and sanitized screenshots appear in the [evidence index](../evidence/README.md); the [pilot acceptance gates](review-path.md#enterprise-pilot-acceptance) list what remains before calling a deployment complete.

To review current product behavior, start with [Windows 365 Enterprise documentation](https://learn.microsoft.com/windows-365/enterprise/) and [deployment options](https://learn.microsoft.com/windows-365/enterprise/deployment-options).
