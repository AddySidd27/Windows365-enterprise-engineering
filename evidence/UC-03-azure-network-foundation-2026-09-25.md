# UC-03: Azure network foundation observation

**Observed:** 2026-09-25 UTC, Microsoft Azure portal and Microsoft Intune admin center. This is a high-level text record of visible portal state, not a screenshot or an ANC health result. Resource identifiers, address ranges and billing values are intentionally omitted.

| Check | Live observation |
|---|---|
| Active subscription | Present in the same directory as the Cloud PC |
| Effective Azure role | Owner and User Access Administrator available for first-ANC setup |
| Existing VNet review | Three networks reviewed before selecting a nonoverlapping address range |
| New resource group | Isolated lab group created in Central US |
| New VNet | Dedicated lab network created in Central US |
| Dedicated subnet | Private Cloud PC subnet with ample unused IP capacity |
| Deployment | Azure portal displayed **Your deployment is complete** for the VNet deployment |
| Existing Enterprise Cloud PC | Provisioned, Microsoft Entra joined, Microsoft-hosted network; no ANC shown in Cloud PC inventory |

## Open validation

The subnet currently has **no NAT Gateway, Azure Firewall or other explicit outbound path**. A new private subnet defaults to no outbound internet access. Do not claim healthy ANC or move the existing Cloud PC until egress and required Microsoft endpoints are validated. No ANC was created, no Cloud PC was moved, and no restore points were deleted during this observation.

At the time of review, the subscription's forecast exceeded its remaining credit. This is a point-in-time portal observation, not a cost estimate for this lab. A paid, recurring outbound resource requires a defined spending boundary before deployment.

## References

- [Create Azure network connections](https://learn.microsoft.com/windows-365/enterprise/create-azure-network-connection)
- [Network requirements](https://learn.microsoft.com/windows-365/enterprise/requirements-network)
- [Azure NAT Gateway design](https://learn.microsoft.com/azure/nat-gateway/nat-gateway-design)
