# Part 3 lab plan: hybrid joined Cloud PC

**Status:** Design and validation checklist. No hybrid Cloud PC has been provisioned or tested in this tenant. Reviewed 15 October 2026.

This chapter follows the Microsoft Entra joined provisioning chapter. Hybrid join is for an organization with Windows Server Active Directory dependencies. The existing Enterprise Cloud PC here is Microsoft Entra joined on a Microsoft hosted network; it is not evidence for this lab.

## What the learner will build

A separate disposable test user and license, Windows Server AD with working DNS, hybrid device registration, an Azure virtual network with a path to domain controllers, a healthy hybrid Azure network connection (ANC), and a provisioning policy assigned only to the test user. Record the actual topology, domain, OU, region and costs when deployed. Never fill values from an example.

| Gate | Evidence before moving on |
| --- | --- |
| Identity | Test user in AD and Microsoft Entra ID; synchronization and licensing confirmed. Record redacted identifiers and sync method. |
| Domain | Domain controllers reachable from the planned Cloud PC subnet; DNS resolves the AD domain and service records. |
| Device registration | Hybrid join works for domain joined devices. Microsoft Entra Domain Services does not meet this requirement. |
| Azure | Active subscription, region, VNet/subnet capacity, Windows 365 permissions, outbound connectivity and estimated spend. |
| ANC | A new hybrid ANC reports successful critical health checks. Save status, check names, time and warnings. |
| Provisioning | Dedicated policy targets only the disposable test group. Save configuration, assignment, start/end state and errors. |
| Device | Intune and Microsoft Entra records, domain membership and desktop connection agree. Capture original redacted screenshots. |

## Lab sequence

1. Prepare an isolated test plan, Azure cost estimate, life span, rollback and deletion list. Preserve the existing Microsoft hosted Cloud PC assignment.
2. Verify Windows 365 Enterprise and Intune requirements, license, test user, provisioning permissions and Windows corporate enrollment allowance.
3. Set up or identify Windows Server AD, domain controllers and DNS. Establish a supported route from the planned Azure subnet to the controllers. Validate domain resolution and service reachability from that network.
4. Configure Microsoft Entra hybrid join for domain joined devices using Microsoft's current device registration guidance. Verify test identity and device synchronization scope. A cloud user record alone does not prove device registration.
5. In Intune, open Devices > Windows 365 > Azure network connection (portal wording can vary). Create a separate Microsoft Entra hybrid join connection using verified network and AD domain, OU and join account details. Keep secrets out of screenshots and the repository.
6. Wait for the ANC health check. Inspect failures and warnings. Use Retry after a concrete fix. Do not attach an unhealthy ANC to the provisioning policy as a passing lab.
7. Create a separate provisioning policy with that healthy ANC, intended image and a group containing only the disposable test user. Capture settings and assignment, then the actual provisioning result.
8. On the test Cloud PC, verify domain join, Microsoft Entra device state, Intune enrollment, user sign-in and access to a domain resource. Compare portal records with the device and redact tenant names, addresses, secrets and identifiers before publication.
9. For failures, preserve error text, time and the check that isolated the issue. Mark the lab failed or blocked. Keep expected and observed results separate.
10. Remove the disposable assignment and Cloud PC through the supported service workflow, remove test infrastructure, then confirm Azure resource inventory and billing. Record retained objects and why.

## Evidence record for the future run

| Item | Expected | Observed | Capture |
| --- | --- | --- | --- |
| AD and DNS reachability | Domain lookup and connectivity succeed | Pending | None |
| Hybrid device registration | Test device shows hybrid join state | Pending | None |
| Hybrid ANC | Critical checks successful | Pending | None |
| Provisioning | Disposable Cloud PC provisioned | Pending | None |
| End-user connection | Desktop opens and domain resource works | Pending | None |
| Cleanup | Test resources removed and bill checked | Pending | None |

## Troubleshooting boundary

For domain join failures, inspect DNS, routing, domain controller reachability, OU delegation and join account. Microsoft says ANC checks may create a temporary computer object such as CPC-Hth in the configured OU. For device registration failures, check hybrid join configuration and synchronization separately. A healthy network check alone does not prove a Cloud PC was provisioned.

The earlier Microsoft Entra join ANC experiment in this repository failed its health checks. That is a different connection type and does not prove or disprove this hybrid design. Its paid NAT gateway and public IP were removed; a new lab needs fresh cost authorization and cleanup evidence.

## Microsoft Learn references

- [Windows 365 requirements](https://learn.microsoft.com/en-us/windows-365/enterprise/requirements)
- [Windows 365 network requirements](https://learn.microsoft.com/en-us/windows-365/enterprise/requirements-network)
- [Windows 365 identity and authentication](https://learn.microsoft.com/en-us/windows-365/enterprise/identity-authentication)
- [Azure network connections](https://learn.microsoft.com/en-us/windows-365/enterprise/azure-network-connections)
- [ANC health checks](https://learn.microsoft.com/en-us/troubleshoot/windows-365/health-checks)
- [Configure Microsoft Entra hybrid join](https://learn.microsoft.com/en-us/entra/identity/devices/how-to-hybrid-join)

Next: [Connect to the Enterprise Cloud PC](https://adnanasiddiqui.com/windows-365/connect-verify/).
