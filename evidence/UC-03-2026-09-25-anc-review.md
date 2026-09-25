# UC-03: Azure network connection review

Date: 2026-09-25. Environment: Windows 365 Enterprise lab, East US, Microsoft Entra Join.

## Observed in the portals

- The isolated East US virtual network and private Cloud PC subnet were available for selection in the Intune Azure network connection wizard.
- The Azure lab resource group initially contained the East US virtual network, a NAT gateway and a public IP, plus an earlier Central US virtual network.
- The Azure network connection list contained zero items before this attempt.
- The wizard reached Review + create with the lab subscription, resource group, virtual network and subnet selected. It stated that creation would grant the Windows 365 service Reader on the subscription, Network Interface Contributor on the resource group, and Network User on the virtual network.

## Result and limits

**Blocked before submission.** No connection was created in this check. There is no ANC health result, no test Cloud PC provisioned on this network, and no device-side route or DNS proof. The existing Microsoft-hosted Cloud PC was not moved. This record is a portal observation, not a passed end-to-end lab.

## Lab cleanup verified

The NAT gateway was detached from the private subnet. A reopened subnet view showed NAT gateway: None. The NAT gateway and its public IP were then deleted. After refreshing the Azure resource group, only the East US and Central US virtual networks remained (2 results). The private subnet has no configured outbound NAT after cleanup; a future ANC health test will require an explicit outbound path.

See [the network foundation record](UC-03-azure-network-foundation-2026-09-25.md) for the earlier deployment and [the status index](../docs/live-validation-status.md) for the remaining test gates.
