# Architecture Diagram Review Standard

A diagram is not marked complete because it renders successfully. It must pass the following architecture review.

## Technical review

- Microsoft-managed and customer-managed boundaries are explicit.
- The Cloud PC compute remains in a Microsoft subscription.
- The optional ANC vNIC is shown in the customer VNet.
- Microsoft-hosted network and ANC are not represented as simultaneous requirements.
- Cloud PC compute size is tied to the user's license.
- Azure Virtual Desktop is shown as the connectivity layer, not as a customer-managed host pool.
- No inbound RDP path is shown.
- Microsoft Entra authentication, Conditional Access, Windows 365 authorization, AVD brokering, and remote-session establishment remain distinct.
- Microsoft Intune management is separate from the user-session data path.
- AD DS, DNS, VPN, and ExpressRoute are marked optional and scenario-dependent.

## Visual review

- Readable at GitHub's standard content width.
- No overlapping labels, boxes, arrows, or flow numbers.
- No ambiguous line terminations.
- No unexplained abbreviations.
- Consistent service names, capitalization, color system, and line meanings.
- Legend explains colors and numbered flows.
- Editable Draw.io source and exported SVG/PNG represent the same revision.

## Portfolio review

- The diagram supports the specific use case instead of trying to show every product feature.
- Its explanation states the design decision and operational consequence.
- Tenant, subscription, network, identity, and service ownership can be understood in under one minute.
- Technical claims are validated against current Microsoft Learn documentation.

## Windows 365 experience and servicing flows

These original diagrams explain the documented sequence. They are design illustrations, not portal screenshots or proof that a tenant lab passed. Each topic has editable draw.io source and an SVG preview.

| Topic | Editable source | Preview | Microsoft Learn |
| --- | --- | --- | --- |
| Windows Autopatch pilot | [draw.io](diagrams/source/windows-365-autopatch-flow.drawio) | [SVG](diagrams/exported/windows-365-autopatch-flow.svg) | [Prerequisites](https://learn.microsoft.com/en-us/windows/deployment/windows-autopatch/prepare/windows-autopatch-prerequisites) |
| Windows 365 Boot | [draw.io](diagrams/source/windows-365-boot-flow.drawio) | [SVG](diagrams/exported/windows-365-boot-flow.svg) | [Boot guide](https://learn.microsoft.com/en-us/windows-365/enterprise/windows-365-boot-guide) |
| Windows 365 Switch | [draw.io](diagrams/source/windows-365-switch-flow.drawio) | [SVG](diagrams/exported/windows-365-switch-flow.svg) | [Switch overview](https://learn.microsoft.com/en-us/windows-365/enterprise/windows-365-switch-overview) |

The [dated UC-08 readiness record](../evidence/UC-08-2026-10-16-autopatch-readiness.md) contains the observed portal result. No Autopatch rollout, Boot physical-device setup, or Switch session is validated by these diagrams.
