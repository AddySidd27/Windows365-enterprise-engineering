# Evidence Index

This folder will contain sanitized proof from the lab. A use case is not marked complete until its evidence is present and linked.

## Evidence status

| Use case | Evidence available for sanitization | Still required |
|---|---|---|
| UC-01 Tenant readiness | MDM connection and device enrollment screenshots | Enterprise license and role evidence |
| UC-02 Enterprise provisioning | None | Enterprise provisioning policy and Provisioned Cloud PC |
| UC-03 Network architecture | Microsoft-hosted network design only | ANC configuration, health check, routes, and DNS tests |
| UC-04 Intune inventory | Device enrollment, ownership, Company Portal device status | Sanitized Intune overview and `dsregcmd` output |
| UC-05 Configuration | Edge policy, conflict report, `edge://policy`, managed wallpaper | Sanitized and renamed screenshots |
| UC-06 Security and compliance | Defender output, Firewall output, compliance result | Sanitized per-setting policy reports; BitLocker if tested later |
| UC-07 Applications | Company Portal, Store app selection, install/uninstall result | Final Intune app status and Win32 evidence |
| UC-08 Windows servicing | Update ring configuration | Before/after build, installed KB, restart result |
| UC-09 Conditional Access | Policy setup and sign-in-log screenshots | Confirmed report-only results for the required resource apps |
| UC-10 Lifecycle operations | Restart observed; no publishable evidence yet | Restart proof plus Resize, Move, Restore, and Reprovision evidence after approval |
| UC-11 Joiner/mover/leaver | None | Group, license, grace-period, and recovery evidence |
| UC-12 Troubleshooting | Policy conflict and endpoint checks | One full sanitized incident record |
| UC-13 Image baseline | None | Custom image validation and pilot provisioning evidence |
| UC-14 Local admin and LAPS | None | Group membership, LAPS result, and audit evidence |
| UC-15 Production rollout | None | Ring, cost, performance, Teams, and support handoff evidence |

## Public evidence rules

- Keep the original screenshot outside the public repository.
- Create a sanitized copy.
- Mask tenant names, email addresses, IDs, IP addresses, and billing details.
- Never capture a password, token, QR code, or recovery key.
- Add a short caption that states what the image proves.
- Use the file names defined in `docs/evidence-standard.md`.

## Completion rule

`Design complete` means the build and test steps are ready. `Lab tested` means the action was performed. `Complete with evidence` is used only after the sanitized proof, expected result, troubleshooting, rollback, and references are all present.
