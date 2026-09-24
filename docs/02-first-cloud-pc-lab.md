# First Enterprise Cloud PC: guided pilot

This is a runbook to execute in **your** tenant, not a record of a completed Enterprise test. Record actual results in [the evidence template](../evidence/README.md). Use a disposable pilot identity and a licensed environment. Portal labels can move; compare each screen with the linked Microsoft Learn page before making a change.

## Lab target and worksheet

A single Windows 365 Enterprise Cloud PC, Microsoft Entra joined, on a Microsoft-hosted network, with a gallery image. The pilot user must be able to connect; the device must appear in Intune; one low-risk setting must apply.

| Record before starting | Your value |
|---|---|
| Tenant and pilot user alias (keep real identifiers out of public notes) | ______ |
| License SKU and assigned group | ______ |
| Provisioning group and policy name | ______ |
| Geography/region and reason | ______ |
| Image and language | ______ |
| Pilot device group and one setting | ______ |
| Test date, operator, rollback owner | ______ |

## Gate 1 — prerequisites

1. Read [UC-01](../use-cases/UC-01-tenant-readiness-and-pilot-design.md) and [Microsoft's requirements](https://learn.microsoft.com/windows-365/enterprise/requirements). Confirm Windows 365 Enterprise and supporting Windows, Intune, and Entra entitlements for the pilot user. Confirm the administrator's roles and Microsoft Intune MDM authority.
2. Create a disposable pilot user and assigned groups for licensing, provisioning, and policy scope. Assign the Enterprise license to the pilot user through your chosen group, and verify the user shows the expected service plan and usage location.
3. Confirm no production users are in pilot groups. Record the starting state and who can reverse each assignment.

**Expected:** the pilot user is licensed and eligible; no Cloud PC has been claimed as provisioned yet. **If blocked:** resolve tenant, license, or role problems before creating a policy.

## Gate 2 — choose network and image

1. Use [UC-03](../use-cases/UC-03-network-architecture.md) to confirm that the pilot does not need direct customer VNet routing. Select Microsoft-hosted networking and Microsoft Entra join. Record geography and region choice.
2. Use [UC-13](../use-cases/UC-13-image-and-application-baseline.md) to choose a supported gallery image. Defer custom image work until the basic desktop runs.

**Expected:** you can name the network, join type, image, and reason for each. **If private apps fail the design:** stop and evaluate ANC or a separately tested private access client before provisioning.

## Gate 3 — provision

1. Follow [UC-02's policy steps](../use-cases/UC-02-enterprise-provisioning.md) and the current [Microsoft policy guide](https://learn.microsoft.com/windows-365/enterprise/create-provisioning-policy). Assign only the pilot provisioning group.
2. In Intune, inspect **All Cloud PCs** and the provisioning report. Record the policy, pilot alias, status, any error code, and time. Wait for a **Provisioned** result; do not infer success from policy creation.
3. Confirm the Cloud PC has the intended license size, image, region, and user. Follow [UC-02 troubleshooting](../use-cases/UC-02-enterprise-provisioning.md#troubleshooting) if provisioning does not start or fails.

**Expected:** one Cloud PC in **Provisioned** state for the pilot. **If blocked:** record the exact failed stage and error before changing policy or assignments.

## Gate 4 — connect and verify the device

1. Sign in as the pilot user to the supported [Windows 365 web experience](https://learn.microsoft.com/windows-365/end-user-access-cloud-pc) or [Windows App](https://learn.microsoft.com/windows-app/get-started-connect-devices-desktops-apps). Open the assigned desktop. Confirm that the correct user can sign in and that the desktop is usable.
2. In Intune and Entra, find the Cloud PC record. Compare its primary user, join type, enrollment, and last check-in using [UC-04](../use-cases/UC-04-intune-enrollment-and-inventory.md).
3. On the Cloud PC, run `hostname` and `dsregcmd /status`; check `AzureAdJoined : YES` and the expected tenant. Sanitize identifiers before sharing output.

**Expected:** a connected session, the correct user and device records, and a joined/enrolled Cloud PC. A desktop connection alone does not prove Intune policy applied.

## Gate 5 — one management change

1. Create a pilot-scoped Edge configuration from [UC-05](../use-cases/UC-05-configuration-management.md). Record the setting and assignment group before deployment.
2. Sync or wait for check-in. Inspect the Intune device and per-setting status, then open `edge://policy` on the Cloud PC and confirm the configured value.
3. Record both the portal result and the device-side result. If the policy conflicts or is pending, use [UC-05's conflict workflow](../use-cases/UC-05-configuration-management.md#conflict-troubleshooting-workflow).

**Expected:** the same pilot setting appears in the Intune report and on the device. **If blocked:** preserve the failed report and document the reason; do not mark the gate passed.

## Close out

Complete a dated test record using [the evidence format](../evidence/README.md#record-a-test). Note each gate as Passed, Failed, or Blocked. Keep original screenshots privately and publish sanitized copies only. Do not remove a license or reprovision casually: user data and Cloud PC lifecycle may be affected. For a safe stop, remove the pilot policy assignment only after reading [UC-02 rollback](../use-cases/UC-02-enterprise-provisioning.md#rollback), and retain the record of what happened.

After these gates, continue through [the learning path](03-learning-path.md): apps, updates, security, access, support, and finally lifecycle actions on a disposable pilot.
