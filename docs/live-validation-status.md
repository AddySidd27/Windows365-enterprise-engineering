# Live validation status by use case

This is the reviewer index for **observed** Windows 365 Enterprise results as of 2026-09-24. A procedure in a use case is not a passed lab. Open the linked record for method, scope, screenshots, and limits. "Pending" means no Enterprise test outcome is published for that action.

| Use case | What is observed | What remains pending |
|---|---|---|
| [UC-01](../use-cases/UC-01-tenant-readiness-and-pilot-design.md) | Existing Cloud PC in [pilot record](../evidence/UC-02-2026-09-24-portal-check.md); [license inventory](../evidence/UC-01-03-13-2026-09-24-capacity-review.md) shows 1 Enterprise seat assigned, 0 available | Assignee, service plans, role and isolated group audit; separate pilot capacity |
| [UC-02](../use-cases/UC-02-enterprise-provisioning.md) | Existing Provisioned Enterprise Cloud PC, web session, Entra join and build in [pilot record](../evidence/UC-02-2026-09-24-portal-check.md) | Fresh provisioning run and error-to-recovery trace |
| [UC-03](../use-cases/UC-03-network-architecture.md) | Web connection to existing Cloud PC worked; [network inventory](../evidence/UC-01-03-13-2026-09-24-capacity-review.md) shows 0 ANCs | Hosted network route/DNS evidence; ANC and hybrid variants need separate infrastructure |
| [UC-04](../use-cases/UC-04-intune-enrollment-and-inventory.md) | Intune record, owner, primary user, check-in and device join in [pilot record](../evidence/UC-02-2026-09-24-portal-check.md) | Fresh auto-enrollment trace and enrollment diagnostics |
| [UC-05](../use-cases/UC-05-configuration-management.md) | Edge and wallpaper profiles reported Succeeded in [pilot record](../evidence/UC-02-2026-09-24-portal-check.md) | Edge first-run and `edge://policy`; exact setting and conflict test |
| [UC-06](../use-cases/UC-06-endpoint-security-and-compliance.md) | Six compliance rule results in [security check](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md) | Current device-side Defender/Firewall checks, BitLocker decision test |
| [UC-07](../use-cases/UC-07-application-lifecycle.md) | Two Required apps reported Installed in [app check](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md) | Available, Uninstall and launch tests |
| [UC-08](../use-cases/UC-08-windows-servicing.md) | Device update history, current build and organization policy in [update check](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md) | Controlled ring rollout, restart and before/after report |
| [UC-09](../use-cases/UC-09-conditional-access.md) | [Read-only policy review](../evidence/UC-09-2026-09-24-conditional-access-review.md): one report-only MFA policy; impact pane had zero matching sign-ins in seven days | What If, scoped pilot sign-in, report-only result and relevant sign-in logs |
| [UC-10](../use-cases/UC-10-cloud-pc-lifecycle-operations.md) | Automatic restore points listed in [restore inventory](../evidence/UC-06-07-08-10-2026-09-24-pilot-check.md) | Restart, resize, move, restore and reprovision action results |
| [UC-11](../use-cases/UC-11-joiner-mover-leaver.md) | None published | Controlled joiner/mover/leaver and grace-period checks |
| [UC-12](../use-cases/UC-12-monitoring-and-troubleshooting.md) | Initial web connection returned HTTP 502; retry connected in [pilot record](../evidence/UC-02-2026-09-24-portal-check.md). [Monitoring snapshot](../evidence/UC-12-2026-09-24-monitoring-check.md) shows aggregate connection metrics | Complete incident with correlated logs, root cause and recovery proof |
| [UC-13](../use-cases/UC-13-image-and-application-baseline.md) | Existing policy uses a supported gallery image; [inventory](../evidence/UC-01-03-13-2026-09-24-capacity-review.md) shows 0 custom images | Image release/version test and custom image only if required |
| [UC-14](../use-cases/UC-14-local-admin-laps-and-security-baseline.md) | None published | Local group, LAPS policy and protected rotation test; no password disclosure |
| [UC-15](../use-cases/UC-15-production-rollout-cost-and-continuity.md) | None published | Persona/ring rollout, billing, media, support and continuity measures |

The existing Cloud PC is useful for non-destructive pilot validation. Restore/reprovision can remove newer changes, resize can affect license costs, and ANC/hybrid require infrastructure. These actions need a disposable target, documented preconditions, and a rollback/data plan before they are called tested. The [review gates](review-path.md#enterprise-pilot-acceptance) remain the acceptance checklist.
