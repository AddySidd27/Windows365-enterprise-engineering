# Windows 365 Enterprise Coverage Matrix

This matrix shows where each topic is covered. A topic is not complete until the linked use case includes setup, validation, evidence, troubleshooting, and rollback.

## Platform and design

| Topic | Main file | Status |
|---|---|---|
| Windows 365 Enterprise service model | `README.md` | Covered |
| Microsoft-managed and customer-managed responsibilities | `docs/architecture-decisions.md` | Covered |
| Licensing prerequisites | `use-cases/UC-01-tenant-readiness-and-pilot-design.md` | Covered |
| Administrative roles and least privilege | `use-cases/UC-01-tenant-readiness-and-pilot-design.md` | Covered |
| Pilot groups and assignment design | UC-01 | Covered |
| Cloud PC size and license relationship | UC-02 and UC-10 | Covered |
| Microsoft Entra Join | UC-02 and UC-03 | Covered |
| Hybrid Microsoft Entra Join | UC-03 | Covered |
| Microsoft-hosted network | UC-02 and UC-03 | Covered |
| Azure Network Connection | UC-03 | Covered |
| Region and data-location decision | UC-02 and UC-03 | Covered |

## Provisioning and device management

| Topic | Main file | Status |
|---|---|---|
| Provisioning policy | UC-02 | Covered |
| Gallery image | UC-02 | Covered |
| Custom image lifecycle | UC-13 | Design complete; live evidence pending |
| Single sign-on | UC-02 and UC-09 | Covered |
| Cloud PC provisioning monitoring | UC-02 and UC-12 | Covered |
| Intune enrollment | UC-04 | Covered |
| Device ownership and primary user | UC-04 | Covered |
| MDM sync and diagnostics | UC-04 and UC-12 | Covered |
| Device and user assignment scope | UC-01, UC-04, and UC-05 | Covered |

## Configuration, security, and compliance

| Topic | Main file | Status |
|---|---|---|
| Settings Catalog | UC-05 | Covered |
| Microsoft Edge policy | UC-05 | Covered |
| Managed desktop background | UC-05 | Covered |
| Policy conflict troubleshooting | UC-05 and UC-12 | Covered |
| Defender Antivirus | UC-06 | Covered |
| Windows Firewall | UC-06 | Covered |
| Windows encryption and BitLocker decision | UC-06 | Design decision covered; live validation pending |
| Windows compliance policy | UC-06 | Covered |
| Company Portal compliance result | UC-06 | Covered |
| Security baselines | UC-14 | Design complete; live evidence pending |
| Local administrator and Windows LAPS | UC-14 | Design complete; live evidence pending |

## Applications and updates

| Topic | Main file | Status |
|---|---|---|
| Company Portal deployment | UC-07 | Covered |
| Required application | UC-07 | Covered |
| Available application | UC-07 | Covered |
| Uninstall assignment | UC-07 | Covered |
| Manually installed application removal | UC-07 | Covered |
| Win32 packaging and detection | UC-07 | Documented; evidence pending |
| Microsoft 365 Apps | UC-13 | Covered |
| Application dependencies and supersedence | UC-13 | Covered |
| Update rings | UC-08 | Covered |
| Quality and feature update control | UC-08 | Covered |
| Driver update policy | UC-08 | Covered |
| Restart and active-hours behavior | UC-08 | Covered |
| SCCM and Intune update-model difference | UC-08 | Covered |

## Identity and access

| Topic | Main file | Status |
|---|---|---|
| MFA policy | UC-09 | Covered |
| Windows 365 resource application | UC-09 | Covered |
| Azure Virtual Desktop resource application | UC-09 | Covered |
| Windows Cloud Login | UC-09 | Covered |
| Conditional Access report-only validation | UC-09 | Covered |
| Sign-in logs and What If | UC-09 | Covered |
| Compliant-device requirement | UC-09 | Covered |
| Emergency access exclusion | UC-09 | Covered |
| Security Defaults interaction | UC-09 | Covered |
| Passwordless authentication | UC-09 | Reference coverage; focused live test pending |

## Cloud PC operations

| Topic | Main file | Status |
|---|---|---|
| Restart | UC-10 | Covered |
| Resize with direct license | UC-10 | Covered |
| Resize with group-based license | UC-10 | Covered |
| Move region or network | UC-10 | Covered |
| Point-in-time restore | UC-10 | Covered |
| Reprovision | UC-10 | Covered |
| Grace period | UC-11 | Covered |
| Deprovisioning | UC-11 | Covered |
| End grace period | UC-11 | Covered |
| Frontline shared mode | Not part of the current dedicated Enterprise lab | Clearly out of scope |
| Cloud PC connection quality | UC-12 | Covered |

## Enterprise operations

| Topic | Main file | Status |
|---|---|---|
| Joiner, mover, and leaver | UC-11 | Covered |
| Persona-based deployment | UC-11 | Covered |
| Support triage | UC-12 | Covered |
| ANC health checks | UC-03 and UC-12 | Covered |
| Device-side PowerShell baseline | UC-04, UC-06, and validation script | Covered |
| Monitoring and reports | UC-12 | Covered |
| Disaster recovery and regional planning | UC-15 | Covered |
| Cost and license control | UC-15 | Covered |
| Production rollout and change control | UC-15 | Covered |
| User experience and Teams/media | UC-15 | Test plan documented; live evidence pending |

## Evidence status

The written implementation is not the same as lab evidence. Screenshots and command output must be added only after they are captured and sanitized.

| Evidence type | Status |
|---|---|
| Windows 365 Business lab screenshots | Available to sanitize and map |
| Enterprise provisioning screenshots | Required |
| ANC health and network evidence | Required when ANC lab is deployed |
| Conditional Access sign-in evidence | Available to sanitize and map |
| PowerShell endpoint evidence | Available to sanitize and map |
| Resize, Move, Restore, and Reprovision evidence | Required when tested |

## Final completion rule

Items marked **Required before final** cannot remain hidden in a general chapter. They must be added as a focused section or use case, or clearly marked **Not tested in this lab**. The repository must never claim that an untested feature was implemented.
