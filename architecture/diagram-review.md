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
