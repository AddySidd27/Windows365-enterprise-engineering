# UC-03: Temporary outbound path and ANC retry

**Observed:** 2026-10-04 Pacific time (2026-10-05 UTC). This is a live Azure and Intune lab for the existing Microsoft Entra Join ANC, `anc-w365-entra-eastus-lab`. No Cloud PC was moved or provisioned through this connection.

## Setup and action

In the Visual Studio Enterprise subscription, `rg-w365-anc-lab`, Azure successfully deployed a **Standard** NAT gateway `nat-w365-anc-eastus-lab` in East US and a new Standard, static IPv4 public IP `pip-w365-anc-eastus`. The deployment completed shortly after 04:13 UTC on 2026-10-05. The NAT gateway overview showed one associated subnet and one public IP. The selected subnet was `vnet-w365-anc-eastus-lab/snet-cloudpcs` (`10.88.10.0/24`). This was a temporary explicit outbound path for the private subnet.

In Intune, **Devices > Provision Cloud PCs > Azure network connection**, the connection first showed **Checks failed**, **0 Cloud PCs**, and **251 available IPs**. Opened its properties to confirm the subscription, resource group, VNet, and subnet, then selected **Retry**. The list changed to **Running checks**. The previous detailed failure is recorded in the [2026-10-01 health review](UC-03-2026-10-01-anc-health.md).

## Result and limits

The retry completed with **Checks failed**, **0 Cloud PCs**, and **251 available IPs**. The seven tenant, VNet, subnet, enrollment, and first-party permission checks showed **Passed** in the detail pane, but their displayed last-check timestamps were about 03:54 UTC, before this NAT deployment. They are not evidence of a new full pass. The three connectivity checks showed 04:17:23 in the portal display:

| Check | Observed result |
|---|---|
| Endpoint connectivity | **Error.** The expanded failed endpoint output identified `*.infra.windows365.microsoft.com:443`. The pane said a required Windows 365 URL could not be contacted during provisioning. |
| Localization language package readiness | **Passed.** This changed from the warning seen on 2026-10-01. |
| UDP connection check | **Informational.** Direct STUN connectivity failed, but TURN relay succeeded; the pane said the network would use TURN relay for transport. This does not prove direct UDP works. |

The portal's displayed check times were not used to infer a time-zone offset; the browser-side observation was on 2026-10-05 UTC. The endpoint error is still a blocker. NAT deployment by itself did not make the ANC healthy. No same-subnet VM DNS, TLS, effective-route, or endpoint test was performed, so the exact cause of the remaining failure is not established. The existing Microsoft-hosted Enterprise Cloud PC remains on its current provisioning policy.

## Cleanup

After the failed result, disassociated `snet-cloudpcs` from the NAT gateway; its overview then showed **0 subnets**. Deleted `nat-w365-anc-eastus-lab`, then deleted the now-unassociated `pip-w365-anc-eastus`. Refreshed `rg-w365-anc-lab` and verified that it listed only the two pre-existing VNets, `vnet-w365-anc-eastus-lab` and `vnet-w365-anc-lab` (**2 results**). The VNet and ANC remain. The short deployment may incur Azure charges; no actual billed amount was verified.

For a future isolated test, check DNS resolution and TCP 443 to the failed Windows 365 endpoint from the intended subnet, inspect effective routes and egress controls, then retry the ANC while an approved outbound path is in place. Do not move the existing Cloud PC while the ANC is failed or without a recovery plan.

## References

- [Azure network connections](https://learn.microsoft.com/windows-365/enterprise/azure-network-connections)
- [Windows 365 network requirements](https://learn.microsoft.com/windows-365/enterprise/requirements-network)
- [Azure NAT Gateway design](https://learn.microsoft.com/azure/nat-gateway/nat-gateway-design)
