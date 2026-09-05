# Windows 365 Enterprise Engineering Portfolio

This repository records tested Windows 365 lab work and the Enterprise designs that extend it. It covers Cloud PC architecture, provisioning, Intune, security, apps, Windows updates, Conditional Access, lifecycle operations, and troubleshooting.

This is an engineering portfolio, not a product textbook. Each use case states the need, design, build steps, checks, evidence, common failures, and rollback.

## What this portfolio demonstrates

- Windows 365 Enterprise tenant and licensing readiness
- Microsoft Entra group-based provisioning and persona design
- Microsoft-hosted network and Azure Network Connection architectures
- Microsoft Entra joined and hybrid joined Cloud PC design
- Provisioning policies, gallery images, custom images, and SSO
- Microsoft Intune configuration, compliance, endpoint security, and reporting
- Required, available, and uninstall application workflows
- Windows Update for Business servicing and operational validation
- Conditional Access, MFA, compliant-device controls, and sign-in analysis
- Resize, move, restore, reprovision, and user lifecycle operations
- Support evidence, troubleshooting workflow, and production rollout controls

## Lab and design scope

| Component | Implementation |
|---|---|
| Cloud PC service | Windows 365 Business live lab plus Windows 365 Enterprise design; Enterprise evidence is added only after each live test |
| Identity | Microsoft Entra ID, pilot users, assigned security groups |
| Management | Microsoft Intune enrollment, configuration, compliance, applications, endpoint security |
| Configuration validation | Microsoft Edge policy and managed desktop background |
| Security validation | Defender Antivirus, Windows Firewall, compliance reporting |
| Application validation | Company Portal deployment and application install/uninstall workflows |
| Servicing validation | Windows Update for Business pilot ring |
| Access validation | Conditional Access in report-only mode and Microsoft Entra sign-in logs |
| Evidence | Business lab screenshots and PowerShell output are being sanitized; Enterprise evidence is still required for Enterprise-only operations |

> Screenshots in this public portfolio must be sanitized. Tenant names, email addresses, device identifiers, IP addresses, subscription IDs, and user information must be removed before publication.

## Architecture

The diagrams use Microsoft Learn-style service boundaries and distinguish Microsoft-managed services from customer-managed configuration.

![Windows 365 Enterprise high-level architecture](architecture/diagrams/exported/01-windows365-enterprise-high-level.svg)

| Diagram | Purpose | Source | Preview |
|---|---|---|---|
| 01 | Windows 365 Enterprise high-level architecture | [Editable Draw.io](architecture/diagrams/source/01-windows365-enterprise-high-level.drawio) | [SVG](architecture/diagrams/exported/01-windows365-enterprise-high-level.svg) |
| 02 | Microsoft Hosted Network architecture | [Editable Draw.io](architecture/diagrams/source/02-microsoft-hosted-network.drawio) | [SVG](architecture/diagrams/exported/02-microsoft-hosted-network.svg) |
| 03 | Microsoft Entra Join with Azure Network Connection | [Editable Draw.io](architecture/diagrams/source/03-entra-join-azure-network-connection.drawio) | [SVG](architecture/diagrams/exported/03-entra-join-azure-network-connection.svg) |
| 04 | Microsoft Entra Hybrid Join with Azure Network Connection | [Editable Draw.io](architecture/diagrams/source/04-hybrid-join-azure-network-connection.drawio) | [SVG](architecture/diagrams/exported/04-hybrid-join-azure-network-connection.svg) |
| 05 | Windows 365 user sign-in and Conditional Access | [Editable Draw.io](architecture/diagrams/source/05-identity-sso-conditional-access.drawio) | [SVG](architecture/diagrams/exported/05-identity-sso-conditional-access.svg) |
| 06 | Intune management and policy delivery | [Editable Draw.io](architecture/diagrams/source/06-intune-management-policy-delivery.drawio) | [SVG](architecture/diagrams/exported/06-intune-management-policy-delivery.svg) |
| 07 | Provisioning lifecycle | [Editable Draw.io](architecture/diagrams/source/07-provisioning-lifecycle.drawio) | [SVG](architecture/diagrams/exported/07-provisioning-lifecycle.svg) |
| 08 | Application and update delivery | [Editable Draw.io](architecture/diagrams/source/08-application-update-delivery.drawio) | [SVG](architecture/diagrams/exported/08-application-update-delivery.svg) |
| 09 | Joiner, mover, and leaver lifecycle | [Editable Draw.io](architecture/diagrams/source/09-joiner-mover-leaver-lifecycle.drawio) | [SVG](architecture/diagrams/exported/09-joiner-mover-leaver-lifecycle.svg) |
| 10 | Cloud PC lifecycle operations | [Editable Draw.io](architecture/diagrams/source/10-cloud-pc-lifecycle-operations.drawio) | [SVG](architecture/diagrams/exported/10-cloud-pc-lifecycle-operations.svg) |

## Use cases

| ID | Use case | Primary skills demonstrated | Status |
|---|---|---|---|
| UC-01 | [Tenant readiness and pilot design](use-cases/UC-01-tenant-readiness-and-pilot-design.md) | Licensing, RBAC, MDM authority, scope control | Business lab tested; Enterprise test pending |
| UC-02 | [Enterprise provisioning](use-cases/UC-02-enterprise-provisioning.md) | Groups, provisioning policy, image, SSO | Enterprise design complete; live test pending |
| UC-03 | [Network architecture](use-cases/UC-03-network-architecture.md) | Microsoft-hosted network, ANC, DNS, routing | Enterprise design complete; ANC test pending |
| UC-04 | [Intune enrollment and inventory](use-cases/UC-04-intune-enrollment-and-inventory.md) | Enrollment, ownership, primary user, sync | Business lab tested; evidence pending |
| UC-05 | [Configuration management](use-cases/UC-05-configuration-management.md) | Settings Catalog, Edge, desktop UX, conflict resolution | Business lab tested; evidence pending |
| UC-06 | [Endpoint security and compliance](use-cases/UC-06-endpoint-security-and-compliance.md) | Defender, Firewall, compliance, reporting | Business lab tested; BitLocker test pending |
| UC-07 | [Application lifecycle](use-cases/UC-07-application-lifecycle.md) | Required, available, uninstall, Win32 detection | Store apps tested; Win32 test pending |
| UC-08 | [Windows servicing](use-cases/UC-08-windows-servicing.md) | Update rings, deadlines, restart behavior, reporting | Business pilot ring created; result evidence pending |
| UC-09 | [Conditional Access](use-cases/UC-09-conditional-access.md) | MFA, compliant device, app targeting, sign-in logs | Report-only setup tested; full result validation pending |
| UC-10 | [Cloud PC lifecycle operations](use-cases/UC-10-cloud-pc-lifecycle-operations.md) | Restart, resize, move, restore, reprovision | Restart observed; remaining action evidence pending |
| UC-11 | [Joiner, mover, and leaver](use-cases/UC-11-joiner-mover-leaver.md) | Licensing groups, grace period, deprovisioning | Design complete; live lifecycle test pending |
| UC-12 | [Monitoring and troubleshooting](use-cases/UC-12-monitoring-and-troubleshooting.md) | Reports, diagnostics, device-side validation | Partial lab validation; evidence pending |
| UC-13 | [Image and application baseline](use-cases/UC-13-image-and-application-baseline.md) | Gallery images, custom images, M365 Apps, app lifecycle | Design complete; live evidence pending |
| UC-14 | [Local admin, LAPS, and security baseline](use-cases/UC-14-local-admin-laps-and-security-baseline.md) | Account Protection, Windows LAPS, privilege control | Design complete; live evidence pending |
| UC-15 | [Production rollout, cost, and continuity](use-cases/UC-15-production-rollout-cost-and-continuity.md) | Personas, rollout rings, cost, DR planning, Teams | Design complete; scale evidence pending |

## Repository structure

```text
.
|-- architecture/
|   `-- diagrams/
|       |-- source/          # Editable Draw.io files
|       `-- exported/        # SVG and PNG previews
|-- docs/                    # Architecture decisions and operating standards
|-- use-cases/               # Evidence-first implementation scenarios
|-- evidence/
|   `-- screenshots/         # Sanitized portfolio evidence
|-- scripts/
|   `-- validation/          # Non-destructive verification commands
|-- README.md
|-- SECURITY.md
`-- LICENSE
```

## Validation standard

A use case is complete only when it contains:

1. A real business requirement and defined scope.
2. The chosen design and rejected alternatives.
3. Exact implementation steps.
4. Device-side and portal-side validation.
5. Sanitized evidence.
6. Common failure scenarios and troubleshooting.
7. Rollback or cleanup guidance.
8. Current Microsoft Learn references.

Review controls:

- [Coverage matrix](docs/completeness-matrix.md)
- [Writing standard](docs/writing-standard.md)
- [Evidence standard](docs/evidence-standard.md)
- [Architecture diagram review](architecture/diagram-review.md)
- [Evidence index](evidence/README.md)

## Microsoft reference architecture

- [Windows 365 architecture](https://learn.microsoft.com/windows-365/enterprise/architecture)
- [Windows 365 requirements](https://learn.microsoft.com/windows-365/enterprise/requirements)
- [Azure network connections](https://learn.microsoft.com/windows-365/enterprise/azure-network-connections)
- [Windows 365 identity and authentication](https://learn.microsoft.com/windows-365/enterprise/identity-authentication)
- [Conditional Access for Windows 365](https://learn.microsoft.com/windows-365/enterprise/set-conditional-access-policies)

## Disclaimer

The tenant names, identities, addresses, and identifiers in this public repository are placeholders. Production changes require organizational approval, change control, security review, tested rollback, and validation against current Microsoft documentation.
