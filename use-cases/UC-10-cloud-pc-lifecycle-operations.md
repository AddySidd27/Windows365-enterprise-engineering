# UC-10: Cloud PC Lifecycle Operations

> **Status:** Restart was observed in the lab. Resize, Move, Restore, and Reprovision remain documented test scenarios. No destructive action is presented as completed.

## Business requirement

Choose the least disruptive Windows 365 action, protect user data, communicate downtime, monitor the service action, and prove the result.

## Action decision matrix

| Requirement | Action | Same Cloud PC | Data result | Important limit |
|---|---|---:|---|---|
| Recover from a normal operating-system issue | Restart | Yes | Stored data is retained; unsaved work can be lost | Standard reboot and short interruption |
| Change CPU, RAM, or disk capacity | Resize | Yes | User and disk data are retained | Disk can increase but not decrease; GPU Cloud PCs are unsupported |
| Change a supported region or network placement | Move | Yes | Data is retained | Join type cannot change; old-location restore points are deleted |
| Return the device to an earlier state | Point-in-time restore | Yes | Changes after the selected point are lost | Use the closest suitable restore point |
| Wipe and rebuild from the current provisioning policy | Reprovision | No | Local data, apps, and customizations are deleted | Device must be **Failed** or **Provisioned** |

## Common safety gate

1. Confirm the user, Cloud PC, current status, and business reason.
2. Select the least disruptive action that meets the requirement.
3. Tell the user to save work and sign out when access can be interrupted.
4. Confirm important files are synchronized to OneDrive or another approved service.
5. Record current configuration, application, compliance, and service status.
6. Obtain approval for extended downtime or data loss.
7. Monitor the action in Windows 365 and validate the device afterwards.

## Restart

Restart is a standard operating-system reboot. It does not reprovision the Cloud PC or erase stored data.

1. Notify the user and confirm that work is saved.
2. Open the Cloud PC record and select **Restart**.
3. Monitor the action status.
4. Reconnect and validate sign-in, Windows health, Intune check-in, and required applications.

## Resize

Resize changes resources on the existing Cloud PC without reprovisioning.

- CPU, RAM, and storage can be increased.
- CPU and RAM can be decreased; disk space cannot be decreased.
- GPU Cloud PCs are not supported.
- The user is disconnected and unsaved work might be lost.
- Direct-assigned and group-based licenses are supported.

For a direct-assigned license, Windows 365 performs the license reassignment. For a group-based license, the Cloud PC enters **Resize pending license** for up to 48 hours. The resize starts only after the source license is removed and the exact target license is assigned. Use separate Microsoft Entra groups for licensing and provisioning-policy assignment.

```powershell
Get-CimInstance Win32_ComputerSystem |
  Select-Object Name, NumberOfLogicalProcessors, TotalPhysicalMemory

Get-Volume -DriveLetter C |
  Select-Object DriveLetter, Size, SizeRemaining
```

## Move

Move keeps the existing Cloud PC and supports documented changes between regions, Azure network connections (ANCs), and Microsoft-hosted network and ANC placements.

- The Cloud PC is shut down and can be inaccessible for up to several hours.
- Microsoft Entra join to Microsoft Entra hybrid join, or the reverse, is not supported.
- Restore points in the old region or ANC are deleted after the move.
- Up to 100 selected Cloud PCs can be moved in one subset operation.
- A Cloud PC cannot be moved from one provisioning policy to another.
- To change virtual network or subnet, create a new ANC and move the Cloud PC to it.

Start with noncritical Cloud PCs, notify users, apply the provisioning-policy network or region change, and track the **Cloud PC actions** report.

## Point-in-time restore

Restore returns the same Cloud PC to an earlier state.

- Short-term points can be created every 4, 6, 12, 16, or 24 hours; ten are retained.
- Four long-term restore points are created every seven days.
- One manual restore point can exist per Cloud PC and normally expires after about 28 days.
- All local changes after the selected point are lost, including files, apps, and configuration.
- External cloud data such as OneDrive is not rolled back.
- Rolling passwords, secrets, certificates, and keys can become inconsistent.

Create a timestamped disposable file, confirm protected user data, choose the closest suitable point, run Restore, and immediately validate sign-in, management, compliance, security, applications, updates, and user data.

## Reprovision

Reprovision wipes the current Cloud PC and creates a new Cloud PC for the same assigned user from the current provisioning policy. The replacement often receives a new device name.

Before selecting **Reprovision**:

- Confirm the device status is **Failed** or **Provisioned**.
- Confirm important user data is protected outside the Cloud PC.
- Export required troubleshooting evidence.
- Record installed applications and policy state.
- Confirm the current provisioning policy, image, network, and assignments.
- Obtain explicit approval for the wipe and downtime.

After completion, treat the result as a new managed device and repeat the complete post-action validation.

## Post-action validation

| Area | Evidence |
|---|---|
| Identity and access | User can connect and sign in; `dsregcmd /status` shows the expected join state |
| Management | Intune device record is active and the last check-in updates |
| Compliance and security | Compliance, Microsoft Defender, Firewall, and encryption state are reviewed |
| Applications and policy | Required apps, Edge policy, configuration profiles, and update policy are present |
| User experience | User data, OneDrive sync, desktop readiness, and reconnect behavior are checked |
| Service action | Action, operator, start/end time, result, and remediation are recorded |

## Troubleshooting and limits

| Symptom | Check |
|---|---|
| Resize is unavailable | Cloud PC state, target license inventory, supported size path, and GPU limitation |
| Resize remains pending | Source license removal and exact target license assignment within 48 hours |
| Move is unavailable or fails | Supported join type, ANC health, hybrid-join domain reachability, and policy configuration |
| Restore causes sign-in or agent failure | Try a more recent suitable restore point; review changed credentials and certificates |
| Reprovisioned device is incomplete | Current policy, image, network, group assignment, app status, and policy status |

A completed Move cannot recover restore points deleted from the old location. Restore cannot recover local changes made after the selected point. Reprovision cannot recover deleted local data.

## Evidence

- Screenshot of the selected Windows 365 action and target Cloud PC
- Cloud PC actions report result and timestamps
- Before-and-after configuration or hardware evidence where applicable
- Post-action identity, management, compliance, security, application, and user-data checks
- Approval record for Move, Restore, or Reprovision testing

## Rollback

- Restart has no service rollback; troubleshoot the operating system if the issue remains.
- A resize requires another supported resize and the required license. Disk space cannot be reduced.
- Move does not restore deleted restore points from the previous location. A later supported move is a new operation.
- Restore can be attempted again with another suitable restore point, but changes made after a selected point remain at risk.
- Reprovision cannot restore deleted local data. Recovery depends on data already stored outside the wiped Cloud PC.

## References

- [Cloud PC resizing overview](https://learn.microsoft.com/windows-365/enterprise/resize-cloud-pc)
- [Cloud PC move](https://learn.microsoft.com/windows-365/enterprise/move-cloud-pc)
- [Point-in-time restore for Windows 365 Enterprise](https://learn.microsoft.com/windows-365/enterprise/restore-overview)
- [Reprovision a Cloud PC](https://learn.microsoft.com/windows-365/enterprise/reprovision-cloud-pc)
- [Cloud PC actions report](https://learn.microsoft.com/windows-365/enterprise/report-cloud-pc-actions)
