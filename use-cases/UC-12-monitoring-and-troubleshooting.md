# UC-12: Monitoring, Support Evidence, and Troubleshooting

> **Status:** Partial Business lab checks reported; a published end-to-end incident record is pending.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/01-windows365-enterprise-high-level.svg) · [Edit the source](../architecture/diagrams/source/01-windows365-enterprise-high-level.drawio). Start troubleshooting at the affected service boundary and follow the evidence to the device.

## Business requirement

Use one support flow for every incident. Find whether the fault is in identity, access, the session, the Cloud PC, Intune, policy, apps, Windows Update, or the customer network.

## Troubleshooting sequence

### 1. Define the symptom

Record:

- Affected user and Cloud PC
- Client type and version
- Start time and timezone
- Exact error message
- Whether the issue affects portal discovery, connection, Windows sign-in, in-session access, or device management
- Scope: one user, one persona, one region, or all users

### 2. Identity and access

- Confirm account and license state.
- Review Windows 365, Azure Virtual Desktop, and Windows Cloud Login sign-ins as applicable.
- Review authentication details, device information, and Conditional Access results.
- Check whether another enabled policy—not the test policy—caused the block.

### 3. Windows 365 service and provisioning

- Review Cloud PC state and provisioning errors.
- Review Cloud PC actions and connection-quality reports.
- Check Microsoft service health.
- Validate provisioning-policy and group assignment.

### 4. Client and session

- Test Windows App and web separately.
- Confirm client endpoint access to required AVD and authentication endpoints.
- Capture correlation/activity identifiers where presented.
- Verify whether the failure occurs before or after the remote session starts.

### 5. Cloud PC health

Run the repository baseline script:

```powershell
.\scripts\validation\cloud-pc-baseline.ps1
```

Also record CPU, memory, disk, and network utilization during the issue.

### 6. Intune management

- Review device last check-in.
- Review configuration, compliance, security, app, and update status.
- Use per-setting status before changing policy.
- Export MDM diagnostics when enrollment or policy processing is suspected.

### 7. ANC network path

For ANC deployments:

- Review ANC health checks.
- Validate IP capacity.
- Validate DNS, route, NSG, Firewall/NVA, proxy, and TLS inspection behavior.
- For Hybrid Join, validate domain-controller reachability, time, secure channel, and OU permissions.

## Evidence collection

Capture only what is required:

- Intune device overview and check-in
- Cloud PC provisioning/action state
- Relevant policy per-setting status
- Application install details and IME logs
- Update status and Windows build
- Conditional Access sign-in result
- Sanitized `dsregcmd /status`
- Defender and Firewall status
- ANC health and device-side connectivity tests

## Root-cause record

Every resolved portfolio incident should state:

1. User-visible symptom
2. Scope and impact
3. Failed layer
4. Evidence that isolated the layer
5. Root cause
6. Remediation
7. Validation
8. Prevention or monitoring improvement

## Evidence

- Intune device overview and last check-in
- Relevant policy per-setting report
- Conditional Access sign-in result
- Cloud PC action or provisioning report
- Sanitized endpoint command output
- Root-cause record with the fix and final validation

## Example incident: Edge policy conflict

**Symptom:** Homepage applied but startup action reported Conflict.

**Isolation:** Per-setting status identified only the startup setting. `edge://policy` confirmed the homepage was healthy.

**Root cause:** Another configuration profile targeted the same Edge startup policy.

**Resolution:** Removed the duplicate setting from the secondary profile, synchronized the Cloud PC, reloaded Edge policies, and confirmed successful reporting.

**Prevention:** Maintain one policy owner per setting and review assignment overlap before deployment.

## Rollback

Change one layer at a time. Record the original setting before remediation. If the change does not fix the issue, restore that setting before testing another cause. Do not reprovision a Cloud PC until logs, reports, user data, and the provisioning design are captured.

## References

- [Cloud PC connection quality report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pc-connection-quality)
- [Cloud PCs that are not available report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pcs-not-available)
- [Cloud PC actions report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pc-actions)
- [Troubleshoot Windows 365](https://learn.microsoft.com/windows-365/enterprise/troubleshooting)
- [Collect Windows MDM logs](https://learn.microsoft.com/windows/client-management/mdm-collect-logs)
