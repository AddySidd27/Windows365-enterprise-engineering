# UC-08: Enterprise update ring report

**Observed:** 2026-10-06 Pacific time. Read-only review in Intune. No update policy or device setting was changed.

## Portal result

Under **Devices > Windows updates > Update rings**, the existing `W365-BUS-UPD-Pilot` ring showed Feature and Quality as **Running**. Its settings allowed Microsoft product updates and Windows drivers, used 0-day quality and feature deferrals, the General Availability channel, automatic installation and restart at maintenance time, and active hours from 4 AM to 5 PM. Deadline settings were allowed, but the feature and quality deadlines and grace period displayed **No Deadline**.

The ring listed one included group, `WIndows 365 - Busniess`, and no excluded groups. Its device check-in report listed two successful records with zero errors, conflicts, or in-progress records. One record belonged to the existing Enterprise Cloud PC identified in the Windows 365 inventory. Its status was **Success**, with last report modification displayed as 2026-09-24 07:22:09 in the portal's time zone. The other record was a different Cloud PC. The group label alone does not establish edition scope; the device report is the evidence that the Enterprise device received this policy.

## Interpretation and limits

**Success** is an Intune policy check-in result. It does not prove that a new quality update installed, that a restart occurred within active hours, or that the device reached a target build. This review did not create the `W365-ENT-UPD-Pilot` example in the use case, change the existing ring, force an update, or restart the only working Enterprise seat. A controlled rollout still needs a scoped pilot assignment, before and after build and update history, restart observation, and a reconnect check.
