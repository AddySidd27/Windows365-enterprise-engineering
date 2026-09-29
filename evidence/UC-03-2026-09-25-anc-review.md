# UC-03: Azure network connection review

Date: 2026-09-25. Environment: Windows 365 Enterprise lab, East US, Microsoft Entra Join.

## Observed in the portals

- The isolated East US virtual network and private Cloud PC subnet were available for selection in the Intune Azure network connection wizard.
- The Azure lab resource group initially contained the East US virtual network, a NAT gateway and a public IP, plus an earlier Central US virtual network.
- The Azure network connection list contained zero items before this attempt.
- The wizard reached Review + create with the lab subscription, resource group, virtual network and subnet selected. It stated that creation would grant the Windows 365 service Reader on the subscription, Network Interface Contributor on the resource group, and Network User on the virtual network.

## Result and limits

**Blocked before submission on 2026-09-25.** No connection was created in that check. The subsequent attempt is recorded below. The existing Microsoft-hosted Cloud PC was not moved. This record is a portal observation, not a passed end-to-end lab.

## Lab cleanup verified

The NAT gateway was detached from the private subnet. A reopened subnet view showed NAT gateway: None. The NAT gateway and its public IP were then deleted. After refreshing the Azure resource group, only the East US and Central US virtual networks remained (2 results). The private subnet has no configured outbound NAT after cleanup; a future ANC health test will require an explicit outbound path.

## Subsequent ANC creation observed on 2026-09-26

With the connection list still empty, the Microsoft Entra Join ANC named `anc-w365-entra-eastus-lab` was submitted using the lab subscription, resource group, East US VNet and `snet-cloudpcs` subnet. Intune then listed one connection with **Running checks**, **0 Cloud PCs**, and East US as the region. Azure briefly listed a health-check network interface in the lab group. This is evidence that a check started, not that it passed.

The NAT gateway and public IP had been deleted before this connection was submitted. A later attempt to recreate the outbound path reached the Azure wizard's Networking step but was **not submitted**. No replacement NAT gateway or public IP deployment was observed in that attempt. The last observed ANC status was Running checks; the completed health result and any failed-check details have not been inspected. No Cloud PC was provisioned or moved onto this ANC. Do not assign this connection to a provisioning policy until its current health status and outbound route are verified.

See [the network foundation record](UC-03-azure-network-foundation-2026-09-25.md) for the earlier deployment and [the status index](../docs/live-validation-status.md) for the remaining test gates.
