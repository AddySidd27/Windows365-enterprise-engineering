# UC-07: Company Portal on the Enterprise Cloud PC

Date (UTC): 2026-09-24  
Scope: signed-in assigned user on the existing Windows 365 Enterprise Cloud PC  
Method: Windows App web session; Company Portal launched from the Cloud PC Start app list; read-only Home, Apps and Downloads & updates views

## Observed result

- Company Portal opened and displayed its Home page. This establishes a user-side launch, beyond the earlier [Intune installed report](UC-06-07-08-10-2026-09-24-pilot-check.md).
- Home said the administrator had not made any apps available to this user. The **Apps > All** catalog showed **No available apps**. This is the observed current user experience, not evidence of a failed Available assignment; no suitable assignment was inspected or created in this check.
- **Downloads & updates > Installed apps** listed **Company Portal** and **Microsoft Whiteboard**, both **Required by your organization: Yes** and **Installed**. This is a user-side list that corroborates the earlier Intune Required-install report. Version was **Not reported** in this view.
- The Whiteboard row's options offered **Reinstall** and **Share**, not a verified app launch. Whiteboard's own opening screen, detection rules, Available delivery and controlled Uninstall remain untested.

![Company Portal launches to Home and shows no recently published available apps](UC-07-2026-09-24-company-portal-launch.jpg)

![Company Portal Apps catalog shows no available apps](UC-07-2026-09-24-company-portal-catalog.jpg)

![Company Portal lists the two Required apps as Installed](UC-07-2026-09-24-company-portal-installed.jpg)

## Conclusion

**Partial lab result.** Company Portal launch and the device/user-side Required-app listing were verified. The Available, Uninstall, and Whiteboard application launch paths need separate scoped tests. No app was installed, reinstalled, removed, or assigned in this check.
