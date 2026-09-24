# Architecture Decisions

This document records the decisions behind the implementation. It focuses on why each option was selected and what operational trade-off it creates.

## ADR-01: Windows 365 Enterprise

**Decision:** Use Windows 365 Enterprise for centrally managed, persistent, one-to-one Cloud PCs.

**Why:** The target design requires Microsoft Intune management, group-based provisioning, enterprise security controls, custom image support, and customer-network integration options.

**Operational consequence:** The customer manages identity, licenses, policy, applications, security configuration, and optional Azure networking. Microsoft operates the underlying Cloud PC compute platform.

## ADR-02: Microsoft Entra Join by default

**Decision:** Use Microsoft Entra joined Cloud PCs for new cloud-first personas unless a documented dependency requires hybrid join.

**Why:** It removes the domain-controller line-of-sight requirement and reduces DNS, network, domain-join, and synchronization dependencies.

**Use hybrid join only when:** A workload has a validated dependency on traditional AD DS device identity, GPO processing, or another domain-based requirement that cannot yet be modernized.

## ADR-03: Network choice is persona-driven

**Microsoft-hosted network:** Use when the persona does not require customer-controlled VNet routing. Private applications may still be reached through a supported VPN or private access client; test that path explicitly.

**Azure Network Connection:** Use when the persona requires a customer VNet, private Azure services, controlled egress, custom DNS, inspection through Azure Firewall/NVA, or hybrid connectivity.

An ANC does not automatically mean hybrid join. Microsoft Entra Join with ANC is a supported cloud-native design.

## ADR-04: Separate groups by purpose

Use separate Microsoft Entra groups for:

- Windows 365 license assignment
- Provisioning-policy assignment
- Device-scoped Microsoft Intune policies
- User-scoped application and configuration assignments

This separation makes resize, rollout, rollback, and troubleshooting safer. Cloud PC size is determined by the Windows 365 license assigned to the user, not by the provisioning policy.

## ADR-05: Pilot before broad deployment

Every configuration, security, application, update, and Conditional Access change is first assigned to a dedicated pilot group. Production rollout requires successful device status, per-setting status, user validation, and a documented rollback.

## ADR-06: Conditional Access resources

Windows 365 access design evaluates the relevant first-party resources:

- **Windows 365** for the Cloud PC portal, resource discovery, and service actions
- **Azure Virtual Desktop** for gateway authentication and connection establishment
- **Windows Cloud Login** when Cloud PC single sign-on is configured

Matching policies are preferred where a consistent access experience is required. Emergency access accounts are excluded and policies start in report-only mode.

## ADR-07: Destructive actions run last

Restore, reprovision, license removal, and deprovisioning tests use disposable data and explicit user communication. Resize and Move are treated separately because they preserve the Cloud PC but can disconnect users or remove old restore points.
