# UC-03: Network Architecture and Azure Network Connection

> **Status:** Existing Cloud PC web session connected; live ANC inventory contains 0 connections. ANC and hybrid path tests pending.

The [dated tenant inventory](../evidence/UC-01-03-13-2026-09-24-capacity-review.md) confirms no Azure network connection is configured. The network variants below are engineering procedures, not passed ANC or hybrid tests.

## Business requirement

Select the simplest supported network architecture for each Cloud PC persona while providing private access and traffic inspection only where required.

## Decision matrix

| Requirement | Recommended design |
|---|---|
| Internet and SaaS access only | Microsoft Entra Join + Microsoft-hosted network |
| Customer-controlled egress or private Azure resources | Microsoft Entra Join + ANC |
| Traditional AD DS device join is mandatory | Hybrid Entra Join + ANC |
| Private resources without customer VNet routing | Evaluate Microsoft-hosted network with a supported VPN or private access service; test the client, identity, DNS, and app path |
| Private resources requiring customer VNet routing | Microsoft Entra Join + ANC; validate private DNS and routing |

## Variant A: Microsoft Hosted Network

Use this model when Cloud PCs primarily need internet, Microsoft 365, and SaaS access. Microsoft manages the Cloud PC network interface, IP addressing, routing, and internet egress. The customer continues to manage identity, licenses, provisioning policy, applications, security, compliance, and Conditional Access.

This model does not require a customer Azure subscription, Azure Network Connection, VNet, subnet, NSG, UDR, VPN, or ExpressRoute. It cannot give the customer direct control of the Cloud PC VNet routes or egress. A VPN or private access client may provide access to private applications without an ANC; test this separately because it adds its own client and routing dependencies.

The architecture diagram intentionally does not invent Microsoft-internal VNet, subnet, NSG, or route-table details. Those provider-managed components are outside the customer's configuration and troubleshooting boundary. The design shows only the supported logical services, ownership boundary, and traffic flows that the customer must understand.

[View the Microsoft Hosted Network architecture](../architecture/diagrams/exported/02-microsoft-hosted-network.svg)

## Variant B: Microsoft Entra Join with ANC

This design places the Cloud PC NIC in a customer-selected VNet while the Cloud PC compute remains hosted by Microsoft.

[View the Microsoft Entra Join with Azure Network Connection architecture](../architecture/diagrams/exported/03-entra-join-azure-network-connection.svg)

### Required components

- Azure subscription and resource group
- VNet and dedicated Cloud PC subnet
- Sufficient private IP capacity, including operational headroom
- DNS capable of resolving required private and public services
- Routes and security controls that allow Windows 365, Intune, Windows, and Azure Virtual Desktop endpoints
- Windows 365 Administrator or Intune Administrator
- At least Subscription Reader when creating or editing the ANC
- Permission for Windows 365 to receive Reader on the subscription, Windows365 Network Interface Contributor on the resource group, and Windows365 Network User on the virtual network

It does not inherently require AD DS, Entra Connect, ExpressRoute, or VPN.

## Variant C: Hybrid Entra Join with ANC

[View the Microsoft Entra Hybrid Join with Azure Network Connection architecture](../architecture/diagrams/exported/04-hybrid-join-azure-network-connection.svg)

Add the following only when hybrid join is required:

- Line of sight from the Cloud PC subnet to AD DS domain controllers
- AD-integrated DNS resolution
- Account delegated to join computers to the target OU
- Synchronization between AD DS and Microsoft Entra ID
- ExpressRoute, site-to-site VPN, VNet-hosted domain controllers, or another supported private path

## Implementation

1. Validate subnet capacity and confirm it is not delegated to another service.
2. Validate effective routes and outbound service access.
3. Validate DNS from a test VM in the same VNet/subnet design.
4. Open **Microsoft Intune admin center > Devices > Windows 365 > Azure network connections**.
5. Create an ANC using the intended join type.
6. Select the subscription, resource group, VNet, and subnet.
7. For Hybrid Join only, enter the AD domain, OU, and delegated join credentials.
8. Wait for the first ANC health check to succeed before assigning it to a provisioning policy.
9. Assign the ANC to a pilot provisioning policy and deploy one noncritical Cloud PC.

## Validation

```powershell
ipconfig /all
Resolve-DnsName login.microsoftonline.com
Test-NetConnection login.microsoftonline.com -Port 443
Test-NetConnection <PRIVATE_RESOURCE_FQDN> -Port 443
```

For Hybrid Join, also validate:

```powershell
nltest /dsgetdc:<AD_DOMAIN>
Test-ComputerSecureChannel -Verbose
```

## Evidence

- Sanitized ANC configuration and health-check result
- VNet/subnet architecture diagram
- Effective route and NSG review
- Device-side DNS and private-resource tests

## Common failures

| Symptom | Likely area |
|---|---|
| ANC health check fails DNS | Custom DNS servers, forwarders, route path, port 53 |
| Required endpoints fail | Firewall/NVA allowlist, TLS inspection, UDR, proxy |
| Hybrid domain join fails | OU permission, DC reachability, DNS, time synchronization |
| Provisioning stops due to IP capacity | Subnet address exhaustion |
| Connection is slow | Region placement, hairpin routing, inspection path, client latency |

## Production considerations

- Do not force Microsoft service traffic through an unsupported inspection path.
- Allow Windows Notification Services so Intune can trigger actions promptly.
- Use alternate ANCs where the provisioning-resiliency requirement justifies them.
- Re-run ANC health checks after DNS, route, firewall, or domain changes.

## Rollback

Do not remove a working network assignment before the replacement passes its health check. Keep the pilot on its current provisioning policy until the new ANC is healthy. If a new Cloud PC fails, remove the pilot assignment and fix the ANC before another provisioning attempt. A Move rollback needs a supported destination and a new approved move action; old restore points are not recovered.

## References

- [Windows 365 architecture](https://learn.microsoft.com/windows-365/enterprise/architecture)
- [Azure network connection overview](https://learn.microsoft.com/windows-365/enterprise/azure-network-connections)
- [Windows 365 network deployment options](https://learn.microsoft.com/windows-365/enterprise/windows-365-network-deployment-options)
