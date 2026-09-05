# Portfolio Evidence Standard

Evidence demonstrates that a configuration was deployed and validated. It must not expose tenant or user information.

## Required evidence for each use case

- Configuration or policy overview
- Assignment scope
- Device or user deployment status
- Per-setting status where available
- Cloud PC device-side result
- Relevant PowerShell output
- Date of validation
- Short statement describing what the evidence proves

## Sanitization checklist

Remove or mask:

- Tenant names and tenant IDs
- User names and email addresses
- Device serial numbers and full device IDs
- Public and private IP addresses when not essential
- Subscription IDs and resource IDs
- License contract or billing information
- Authentication prompts, QR codes, tokens, and secrets

## File naming

```text
UC-05-01-policy-overview.png
UC-05-02-device-status.png
UC-05-03-edge-policy-validation.png
```

## Evidence statement example

> This screenshot confirms that the pilot Cloud PC received the device-scoped Microsoft Edge Settings Catalog profile and that the configured homepage was reported as successful in both Microsoft Intune and `edge://policy`.

Screenshots are evidence, not instructions. Implementation steps and validation commands remain in the use-case document.
