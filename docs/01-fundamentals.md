# Windows 365 Enterprise fundamentals

Start here if Cloud PCs are new to you. This page explains the terms used in the use cases; it does not assume that you already manage Azure Virtual Desktop.

## What you are deploying

A Cloud PC is a Windows desktop assigned to a user. Windows 365 provisions and hosts the Cloud PC; the customer manages the user, license, provisioning policy, identity, apps, and device controls. A dedicated Enterprise Cloud PC is associated with an assigned user. A provisioning policy describes how a Cloud PC is created. A Windows 365 license determines its size. The customer does not deploy the Cloud PC virtual machine into its own Azure subscription. See [Enterprise overview](https://learn.microsoft.com/windows-365/enterprise/overview), [architecture](https://learn.microsoft.com/windows-365/enterprise/architecture), and [provisioning](https://learn.microsoft.com/windows-365/enterprise/provisioning).

| Term | Plain meaning | First place to inspect |
|---|---|---|
| Microsoft Entra ID | Identity and device join for the pilot | User and device records |
| Microsoft Intune | Cloud PC device management, policy, apps, and reports | Intune admin center |
| Provisioning policy | Network, join, image, language, and user assignment decisions | Devices > Provision Cloud PCs > Provisioning policies |
| Microsoft-hosted network | Microsoft handles the Cloud PC network; choose a supported geography/region | Provisioning policy |
| Azure network connection (ANC) | Cloud PC network interface joins a customer VNet; customer plans subnet, DNS, routing, and reachability | ANC health and customer VNet |
| Gallery image | Microsoft-provided starting Windows image | Provisioning policy image selection |
| Custom image | Customer-maintained image for a documented need | Image validation and version record |
| Conditional Access | Sign-in rules based on identity and conditions | Report-only policy and sign-in logs |
| Cloud PC status | Provisioning or operational state; inspect before assuming a device is usable | All Cloud PCs |

## How the parts fit together

1. Give a pilot user the required entitlements and assign that user to a provisioning-policy group.
2. Pick a network, join type, and image before creating the policy. For a first pilot, use Microsoft-hosted networking, Microsoft Entra join, and a gallery image.
3. Windows 365 provisions the Cloud PC and enrolls it in Intune. Confirm the service state and device record separately.
4. The user connects through a supported client or web browser. Check the sign-in, session, and actual desktop experience.
5. Apply a small Intune policy or app to a pilot group. Check assignment, report status, and the setting on the Cloud PC.
6. Only after the baseline works, test security, updates, lifecycle actions, and a wider rollout.

## Choose the correct edition and network

This repository follows **Windows 365 Enterprise with a dedicated Cloud PC**. Reported Windows 365 Business lab activity does not establish that Enterprise provisioning succeeded. Frontline shared mode and other Windows 365 offerings have different rules and are outside this lab. Compare current plans before purchasing or assigning licenses: [Windows 365 overview](https://learn.microsoft.com/windows-365/overview) and [Enterprise requirements](https://learn.microsoft.com/windows-365/enterprise/requirements).

Microsoft-hosted networking is the first lab path. An ANC is an additional design and validation exercise when customer VNet routing or private connectivity is needed. A VPN or private access client may be an option on a Microsoft-hosted network, but its application path must be tested separately. Hybrid join adds AD DS, DNS, and reachability prerequisites; choose it for a stated requirement, not by default. Read [UC-03](../use-cases/UC-03-network-architecture.md) and [Microsoft's deployment options](https://learn.microsoft.com/windows-365/enterprise/deployment-options).

## Before touching production

Use one disposable pilot identity and assigned groups. Confirm the current license prerequisites, role permissions, MDM authority, and network choice in [UC-01](../use-cases/UC-01-tenant-readiness-and-pilot-design.md). Do not use a production account for license removal, reprovision, or restore experiments. Provisioning a Cloud PC can consume a paid license; check tenant and billing terms before starting.

**Ready for the lab when:** you can explain who gets the license, which group receives the provisioning policy, why the image and network were chosen, and what result proves that the user connected. Continue to [the first Cloud PC lab](02-first-cloud-pc-lab.md).
