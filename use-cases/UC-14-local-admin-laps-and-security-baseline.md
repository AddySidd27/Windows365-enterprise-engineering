# UC-14: Local Admin, Windows LAPS, and Security Baseline

> **Status:** The [Account protection policy inventory](../evidence/UC-14-2026-09-24-account-protection-check.md) showed no results in that Intune view. Local group membership, Windows LAPS policy/rotation, and security baseline tests remain pending; no password was viewed or published.

## Architecture

[View the related draw.io diagram](../architecture/diagrams/exported/06-intune-management-policy-delivery.svg) · [Edit the source](../architecture/diagrams/source/06-intune-management-policy-delivery.drawio). Account Protection, LAPS, and security baselines are separate Intune controls.

## Business need

Keep normal users as standard users. Give support teams a controlled way to complete approved admin work without giving users permanent local admin rights.

## Account type

Windows 365 Enterprise users should remain standard users unless the role has an approved business need for local admin.

Check local membership:

```powershell
net localgroup administrators
```

Do not add broad user groups to the local Administrators group.

## Account Protection policy

Use **Endpoint security > Account protection** to manage local group membership.

Pilot design:

1. Create `W365-ENT-SEC-LocalGroups-Pilot`.
2. Add only the approved support group or admin identity.
3. Assign the Cloud PC pilot device group.
4. Sync the Cloud PC.
5. Sign out and sign in when required.
6. Check the local Administrators group again.

## Windows LAPS

Windows LAPS can manage a local administrator password and back it up to Microsoft Entra ID when the tenant and device meet the requirements.

The policy must define:

- Backup directory
- Managed local administrator account
- Password age
- Password length and complexity
- Post-authentication action

Only approved roles should read or rotate the password. Review audit logs for password access.

## Test steps

1. Create a Windows LAPS pilot policy.
2. Assign only the pilot device group.
3. Sync the Cloud PC.
4. Check the policy result in Intune.
5. Confirm the password backup exists in the approved directory.
6. Retrieve the password with an approved support account.
7. Use it for one approved local task.
8. Rotate the password after use.
9. Check the audit record.

## Endpoint Privilege Management

If licensed, Endpoint Privilege Management can allow an approved app or task to run with elevation without making the user a permanent local admin. Keep this as a separate design and license decision.

## Security baseline

Use an Intune security baseline as a reviewed starting point, not as a blind one-click hardening tool.

Pilot process:

1. Export or record the current endpoint settings.
2. Review every baseline setting with security, application, and support owners.
3. Create a pilot baseline.
4. Check overlap with Settings Catalog and Endpoint security policies.
5. Assign one pilot Cloud PC.
6. Test sign-in, apps, networking, printing, Teams, updates, and support tools.
7. Fix conflicts before wider rollout.

## Evidence

- Local group before and after policy
- Account Protection assignment and result
- LAPS policy result
- Sanitized password-backup confirmation; never capture the password
- Password rotation event
- Security baseline per-setting report

## Rollback

Remove the pilot assignment and confirm the expected local group membership. Keep a tested emergency support method before removing an existing admin path.

## Troubleshooting

| Problem | Check |
|---|---|
| Local group does not change | Assignment, policy mode, Entra group ID, device sync, conflict |
| LAPS password is not backed up | Device support, backup directory, policy result, account name, Entra registration |
| Support cannot read the password | Entra role and permission, scope, audit result |
| Password does not work | Account state, password age, rotation, local sign-in format |
| Security baseline breaks an app | Per-setting status, overlapping policy, application requirement, pilot rollback |

## Test status

The local-admin and LAPS design is documented. Live Enterprise evidence must be added after the pilot is tested.

## References

- [Windows LAPS with Intune](https://learn.microsoft.com/mem/intune/protect/windows-laps-overview)
- [Intune Account Protection policy](https://learn.microsoft.com/mem/intune/protect/endpoint-security-account-protection-policy)
- [Intune security baselines](https://learn.microsoft.com/mem/intune/protect/security-baselines)
