# Windows 365 Enterprise Coverage Matrix

This is a topic index. “Documented” means a written procedure exists; it does not mean the procedure was run. Use the evidence index for observed results. An Enterprise action remains untested until a dated, sanitized result is linked.

## Platform and design

| Topic | Main file | Documentation status |
|---|---|---|
| Windows 365 Enterprise service model | `README.md` | Documented |
| Microsoft-managed and customer-managed responsibilities | `docs/architecture-decisions.md` | Documented |
| Licensing prerequisites | `use-cases/UC-01-tenant-readiness-and-pilot-design.md` | Documented |
| Administrative roles and least privilege | `use-cases/UC-01-tenant-readiness-and-pilot-design.md` | Documented |
| Pilot groups and assignment design | UC-01 | Documented |
| Cloud PC size and license relationship | UC-02 and UC-10 | Documented |
| Microsoft Entra Join | UC-02 and UC-03 | Documented |
| Hybrid Microsoft Entra Join | UC-03 | Documented |
| Microsoft-hosted network | UC-02 and UC-03 | Documented |
| Azure Network Connection | UC-03 | Documented |
| Region and data-location decision | UC-02 and UC-03 | Documented |

## Provisioning and device management

| Topic | Main file | Documentation status |
|---|---|---|
| Provisioning policy | UC-02 | Documented |
| Gallery image | UC-02 | Documented |
| Custom image lifecycle | UC-13 | Procedure documented; Enterprise test pending |
| Single sign-on | UC-02 and UC-09 | Documented |
| Cloud PC provisioning monitoring | UC-02 and UC-12 | Documented |
| Intune enrollment | UC-04 | Documented |
| Device ownership and primary user | UC-04 | Documented |
| MDM sync and diagnostics | UC-04 and UC-12 | Documented |
| Device and user assignment scope | UC-01, UC-04, and UC-05 | Documented |

## Configuration, security, and compliance

| Topic | Main file | Documentation status |
|---|---|---|
| Settings Catalog | UC-05 | Documented |
| Microsoft Edge policy | UC-05 | Documented |
| Managed desktop background | UC-05 | Documented |
| Policy conflict troubleshooting | UC-05 and UC-12 | Documented |
| Defender Antivirus | UC-06 | Documented |
| Windows Firewall | UC-06 | Documented |
| Windows encryption and BitLocker decision | UC-06 | Design decision covered; live validation pending |
| Windows compliance policy | UC-06 | Documented |
| Company Portal compliance result | UC-06 | Documented |
| Security baselines | UC-14 | Procedure documented; Enterprise test pending |
| Local administrator and Windows LAPS | UC-14 | Procedure documented; Enterprise test pending |

## Applications and updates

| Topic | Main file | Documentation status |
|---|---|---|
| Company Portal deployment | UC-07 | Documented |
| Required application | UC-07 | Documented |
| Available application | UC-07 | Documented |
| Uninstall assignment | UC-07 | Documented |
| Manually installed application removal | UC-07 | Documented |
| Win32 packaging and detection | UC-07 | Documented; evidence pending |
| Microsoft 365 Apps | UC-13 | Documented |
| Application dependencies and supersedence | UC-13 | Documented |
| Update rings | UC-08 | Documented |
| Quality and feature update control | UC-08 | Documented |
| Driver update policy | UC-08 | Documented |
| Restart and active-hours behavior | UC-08 | Documented |
| SCCM and Intune update-model difference | UC-08 | Documented |

## Identity and access

| Topic | Main file | Documentation status |
|---|---|---|
| MFA policy | UC-09 | Documented |
| Windows 365 resource application | UC-09 | Documented |
| Azure Virtual Desktop resource application | UC-09 | Documented |
| Windows Cloud Login | UC-09 | Documented |
| Conditional Access report-only validation | UC-09 | Documented |
| Sign-in logs and What If | UC-09 | Documented |
| Compliant-device requirement | UC-09 | Documented |
| Emergency access exclusion | UC-09 | Documented |
| Security Defaults interaction | UC-09 | Documented |
| Passwordless authentication | UC-09 | Reference coverage; focused live test pending |

## Cloud PC operations

| Topic | Main file | Documentation status |
|---|---|---|
| Restart | UC-10 | Documented |
| Resize with direct license | UC-10 | Documented |
| Resize with group-based license | UC-10 | Documented |
| Move region or network | UC-10 | Documented |
| Point-in-time restore | UC-10 | Documented |
| Reprovision | UC-10 | Documented |
| Grace period | UC-11 | Documented |
| Deprovisioning | UC-11 | Documented |
| End grace period | UC-11 | Documented |
| Frontline shared mode | Not part of the current dedicated Enterprise lab | Clearly out of scope |
| Cloud PC connection quality | UC-12 | Documented |

## Enterprise operations

| Topic | Main file | Documentation status |
|---|---|---|
| Joiner, mover, and leaver | UC-11 | Documented |
| Persona-based deployment | UC-11 | Documented |
| Support triage | UC-12 | Documented |
| ANC health checks | UC-03 and UC-12 | Documented |
| Device-side PowerShell baseline | UC-04, UC-06, and validation script | Documented |
| Monitoring and reports | UC-12 | Documented |
| Disaster recovery and regional planning | UC-15 | Documented |
| Cost and license control | UC-15 | Documented |
| Production rollout and change control | UC-15 | Documented |
| User experience and Teams/media | UC-15 | Test plan documented; live evidence pending |

## Evidence status

The written procedures are not lab evidence. No screenshots or test logs are published in this repository. Add results only after capture, sanitization, and review.

| Evidence type | Status |
|---|---|
| Windows 365 Business lab screenshots | Reported from prior lab; not published |
| Enterprise provisioning screenshots | Required |
| ANC health and network evidence | Required when ANC lab is deployed |
| Conditional Access sign-in evidence | Reported from prior lab; not published |
| PowerShell endpoint evidence | Reported from prior lab; not published |
| Resize, Move, Restore, and Reprovision evidence | Required when tested |

## Completion rule

A documented procedure and an observed outcome are different. Keep Enterprise-only operations marked untested until sanitized results are available.
