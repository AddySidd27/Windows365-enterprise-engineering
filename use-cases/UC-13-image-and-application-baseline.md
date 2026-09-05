# UC-13: Image and Application Baseline

> **Status:** Enterprise design complete. Custom image upload, validation, and reprovision evidence are pending.

## Business need

Choose a simple and supportable way to build Cloud PCs. Keep the image small. Use Intune for apps that need regular updates or uninstall control.

## Design choice

Use a Microsoft gallery image unless a custom image solves a clear business need.

A gallery image is easier to maintain. Microsoft updates the Windows 365 gallery images each month. A custom image adds build, test, version, security, and retirement work.

## Gallery image option

Choose one of these image types in the provisioning policy:

- Windows Enterprise with Microsoft 365 Apps
- Windows Enterprise without Microsoft 365 Apps
- Another supported gallery image that matches the user role

Use Intune to deploy business apps after provisioning. This gives better install, update, detection, and uninstall control.

## When to use a custom image

Use a custom image when the Cloud PC must have a large application or a setting before the user signs in, and Intune delivery does not meet the setup time or technical need.

Do not use a custom image only to preinstall many normal business apps.

## Custom image checks

The source image must meet the current Windows 365 rules. Key checks include:

- Supported Windows 10 or Windows 11 Enterprise
- Generation 2 image
- Single-session image
- Generalized image
- Never joined to AD DS or Microsoft Entra ID
- Never enrolled in Intune or co-management
- No recovery partition
- Default 64-GB OS disk before Windows 365 adjusts it for the license
- No attached data disk
- No FSLogix components
- No more than 3,000 apps in the Start menu
- No Azure Virtual Desktop agent components listed as unsupported by Microsoft
- No disk encryption set on a custom image

A managed-image build VM must use the **Standard** security type. An Azure Compute Gallery image definition must use **Trusted Launch**, x64, and Windows. Windows 365 supports up to 20 uploaded custom images.

## Build and release flow

1. Create a clean Azure build VM from a supported Windows image.
2. Apply Windows updates.
3. Install only approved image-based components.
4. Remove temporary files, build tools, logs, and credentials.
5. Run security and application tests.
6. Generalize the VM.
7. Capture the managed image or Azure Compute Gallery version.
8. Add the image under **Intune admin center > Devices > Provision Cloud PCs > Custom images**.
9. Wait for Windows 365 validation.
10. Create a pilot provisioning policy or update a pilot policy.
11. Provision a new pilot Cloud PC.
12. Test sign-in, Intune enrollment, apps, updates, security, Teams, and performance.

## Version standard

Use a clear version such as `2.3.0` and record:

- Windows build
- Update date
- Image-based components
- Known issues
- Test result
- Approval
- Provisioning policies that use the image

## Microsoft 365 Apps

If the gallery image already includes Microsoft 365 Apps, confirm the update channel and sign-in behavior. If it does not, deploy Microsoft 365 Apps with Intune.

Keep these decisions in the app record:

- Architecture
- Update channel
- Included apps
- Shared computer activation requirement
- Language packs
- Teams installation and media optimization

## Dependencies and supersedence

Use Win32 dependencies when one package must install before another. Use supersedence when a new package replaces or upgrades an old app. Test the uninstall and detection rules before production rollout.

## Existing Cloud PCs

Changing the image in a provisioning policy does not rebuild running Cloud PCs. New Cloud PCs use the current policy image. An existing Cloud PC needs a planned reprovision to receive a fresh image, which removes local data and apps.

## Evidence

- Image source and version record
- Windows 365 image validation result
- Pilot provisioning policy
- New Cloud PC build and enrollment result
- App and Teams test result

## Troubleshooting

| Problem | Check |
|---|---|
| Image is not listed for upload | Image type, Gen2, supported Windows edition, source subscription, role |
| Validation fails | Generalization, recovery partition, prior join/enrollment, unsupported agents, boot test |
| Provisioning fails only with the custom image | Image version, Windows build, provisioning policy, service validation result |
| App is missing after provisioning | Decide whether it belongs in the image or Intune; check Intune assignment and detection |
| Teams media test fails | Image optimization components, client support, network path, Teams version |

## Rollback

Keep the last approved image available until the new version passes the pilot. Point the pilot policy back to the approved image for new Cloud PCs. Existing Cloud PCs are not changed by this policy update. If a pilot was reprovisioned, local data from the prior Cloud PC is not restored by changing the image reference.

## Test status

The gallery-image design is documented. Custom-image upload and reprovision evidence must be added only after a live Enterprise test.

## References

- [Windows 365 device images](https://learn.microsoft.com/windows-365/enterprise/device-images)
- [Add or delete custom device images](https://learn.microsoft.com/windows-365/enterprise/add-device-images)
