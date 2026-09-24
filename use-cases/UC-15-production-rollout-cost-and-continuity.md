# UC-15: Production Rollout, Cost, and Service Continuity

> **Status:** Production rollout procedure documented; scale, cost, Teams, and continuity tests pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/01-windows365-enterprise-high-level.svg) · [Edit the source](../architecture/diagrams/source/01-windows365-enterprise-high-level.drawio). Map ownership and network dependencies before committing to a wider rollout.

## Business need

Move from a working pilot to a supportable production service. Control risk, license cost, user experience, and regional impact.

## Persona plan

Define each persona before assigning licenses.

| Field | Example decision |
|---|---|
| User group | Finance contractors |
| Join type | Microsoft Entra Join |
| Network | ANC for private finance apps |
| License size | Based on measured pilot workload |
| Image | Gallery image with Microsoft 365 Apps |
| Required apps | Finance client, browser, Company Portal |
| Security | Defender, Firewall, compliance, CA |
| Support window | Business hours in user region |
| Data path | OneDrive and approved private services |

## Ring rollout

Use small, clear rings:

1. Engineering test
2. IT pilot
3. Business pilot
4. First production group
5. Broad production

For each ring, define entry checks, success checks, rollback, owner, and wait time.

## Go-live checks

- License capacity is available.
- Provisioning policy and image passed the pilot.
- ANC health is green where used.
- Required apps install successfully.
- Compliance is stable.
- Conditional Access report-only results are understood.
- Support has the runbook and required roles.
- Users received sign-in and data-storage guidance.
- Service health and escalation paths are known.

## Cost control

Windows 365 cost is mainly tied to assigned licenses. Review:

- Active Cloud PCs with inactive users
- Licenses that are assigned but not needed
- Users with a larger SKU than their measured workload needs
- Cloud PCs in grace period
- Failed provisioning that still needs admin action
- Duplicate persona or license-group membership

Resize only after CPU, memory, disk, and user-workload data support the change. Disk size cannot be reduced through Resize.

## Region and continuity plan

Windows 365 removes the need to build customer-managed session-host capacity, but the service still needs a continuity plan.

Windows 365 provides automatic in-zone recovery for supported infrastructure failures. Optional cross-region recovery features address a regional outage:

| Capability | Documented purpose |
|---|---|
| Cross-region disaster recovery | Optional add-on; manually activated; target RTO under four hours for fewer than 50,000 licensed Cloud PCs, subject to alternate-region capacity |
| Disaster Recovery Plus | Optional add-on with reserved alternate-region capacity; Microsoft states target RTO under 31 minutes and RPO under 61 minutes |
| Windows 365 Reserve | Temporary Cloud PCs for physical-device loss, damage, or delivery-delay scenarios |

Cross-region recovery and Disaster Recovery Plus require licensing, configuration, eligible users, alternate-region planning, and administrator activation. Service Health alerts should be enabled so the response team knows when to evaluate failover. Temporary recovery Cloud PCs are discarded on deactivation; changes saved only to their local OS disk do not copy back to the primary Cloud PC. Test an external data path such as OneDrive before relying on the recovery design.

Document:

- User region and chosen Cloud PC region
- Microsoft-hosted network or ANC dependency
- Alternate ANC design where needed
- Customer DNS, Firewall, VPN, ExpressRoute, and AD DS dependencies
- User data stored outside the local Cloud PC
- Restore-point use and limits
- Move plan for a supported region or network change
- Client fallback method such as web access
- Support communication during service or network incidents
- Cross-region recovery entitlement, user group, recovery-point setting, and alternate-region choice where purchased
- Service Health alert ownership and failover authority

Restore is not a full business data backup. Reprovision is not disaster recovery. User data must use an approved data-protection service.

## Performance and Teams test

Run the same test for each main persona:

- Sign-in time
- Desktop ready time
- Main app launch time
- Web response
- Reconnect time
- CPU, memory, disk, and network at idle
- CPU, memory, and network during a Teams meeting
- Microphone, speaker, camera, screen sharing, and captions
- OneDrive sync and file open/save

Use the result to confirm the license size. Do not claim Teams or media optimization is complete from an install screenshot alone.

## Evidence

- Persona decision record
- Ring assignment and success report
- License and Cloud PC reconciliation report
- Performance test results
- Teams/media test
- Support handoff and rollback plan

## Troubleshooting

| Problem | Check |
|---|---|
| Pilot works but the next ring fails | Group scope, license capacity, region capacity, app or policy difference |
| Users report poor performance | License size, region, client network, Cloud PC utilization, application behavior |
| ANC users fail while hosted-network users work | ANC health, DNS, routes, Firewall/NVA, private dependency |
| License cost is higher than planned | Inactive users, grace period, oversized SKU, duplicate group membership |
| Teams quality is poor | Client and Cloud PC network, media optimization, device redirection, Teams version |

## Rollback

Stop the next rollout ring. Keep the last successful group unchanged. Remove only the failed pilot assignment or restore the last approved policy, app, image, or access setting. A regional Move, Restore, or Reprovision follows the separate rollback limits in UC-10.

## Test status

The rollout, cost, and continuity controls are documented. Production-scale evidence must be added only from an approved deployment or a clearly labeled test simulation.

## References

- [Windows 365 architecture](https://learn.microsoft.com/windows-365/enterprise/architecture)
- [Windows 365 sizing recommendations](https://learn.microsoft.com/windows-365/enterprise/cloud-pc-size-recommendations)
- [Cloud PC utilization report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pc-utilization)
- [Cloud PC connection quality report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pc-connection-quality)
- [Business continuity and disaster recovery with Windows 365](https://learn.microsoft.com/windows-365/enterprise/business-continuity-disaster-recovery)
- [Cross-region disaster recovery](https://learn.microsoft.com/windows-365/enterprise/cross-region-disaster-recovery)
- [Disaster Recovery Plus](https://learn.microsoft.com/windows-365/enterprise/disaster-recovery-plus)
