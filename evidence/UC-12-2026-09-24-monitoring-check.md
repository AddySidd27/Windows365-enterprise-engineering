# UC-12: Cloud PC monitoring snapshot

Date (UTC): 2026-09-24, about 18:17  
Environment: Windows 365 Enterprise pilot tenant  
Method: Read-only Intune admin center inspection; no monitoring setting changed

In **Devices > Overview**, the Cloud PC performance summary showed **0 devices with connection issues**, **0 with slow round-trip time**, **0 with low UDP utilization**, **0 with no time connected**, and **1 with low time connected**. The same page showed two Windows devices in total, all currently compliant, no configuration profiles with errors or conflicts, and no devices with update-ring error or conflict. These are aggregate tenant dashboard values, not a per-device diagnosis.

In **Devices > Monitor Cloud PCs (preview) > Connection health**, the portal displayed an update timestamp of **2026-09-24 18:17:31 UTC**. The selected time range was **Last 7 days**. The environment connection-failure-rate trend and total both displayed **0**. The environment outliers table showed **0 items** and stated that it covers the past three days. The active-connection chart displayed an average of **0.00905**; its aggregate should not be interpreted as an individual user session count.

These portal metrics do not identify the cause of the earlier transient HTTP 502 in the [pilot session record](UC-02-2026-09-24-portal-check.md). No correlation ID, service incident, client event, or complete before/after remediation was captured. No incident root cause is asserted. A future UC-12 pass requires a timed failure, relevant sign-in and connection logs, root-cause evidence, remediation, and user-side recovery validation.

No screenshot is published for this check because the live portal view included tenant and account information outside the metrics area. The method, timestamp, scope, and values are recorded for a later repeatable inspection.
