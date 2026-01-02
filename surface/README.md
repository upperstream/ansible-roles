# Ansible Role for Microsoft Surface devices

This Ansible role installs and configures the Linux kernel and drivers
optimised for Microsoft Surface devices.  It currently supports Arch
Linux and Artix Linux distributions.

## Features

- Automatically detects if linux-surface repository is already
  configured
- Adds the linux-surface GPG key and repository to the system
- Installs the Surface-optimized Linux kernel and drivers
- Configures touch and pen input support via iptsd
- Updates GRUB configuration automatically
- Provides system reboot notification when kernel changes are made

## Supported Platforms

- Arch Linux
- Artix Linux

## Requirements

- Target system must be running Arch Linux or Artix Linux
- User must have sudo/root privileges
- System must have internet connectivity to download packages and keys
- An AUR helper must be installed (handled by the `base` role dependency)

## Dependencies

This role depends on the `base` role which installs an AUR helper
(default: `yay`).

## Role Variables

Currently, this role does not expose any user-configurable variables.
All configurations use sensible defaults.

## Packages Installed

The role installs the following packages from the linux-surface
repository:

- `linux-surface` - Surface-optimized Linux kernel
- `linux-surface-headers` - Kernel headers for Surface kernel
- `linux-firmware-intel` - Intel firmware for Surface devices
- `iptsd` - Daemon for Surface touchscreen and pen input
- `libwacom-surface` - Wacom tablet support for Surface devices

## Example Playbook

```
---
- hosts: surface_devices
  roles:
    - base  # Required for AUR helper
    - surface
```

## How It Works

1. Repository Check: Tests if linux-surface repository is already
   configured
2. Repository Setup: If not configured, adds the GPG key and repository
3. Package Installation: Installs Surface-specific kernel and drivers
4. GRUB Update: Regenerates GRUB configuration when kernel packages are
   installed
5. Notification: Displays reboot message when kernel changes are made

## Post-Installation

After running this role:

1. Reboot Required: You must reboot the system to use the new Surface
   kernel
2. Verify Installation: Check that you're running the Surface kernel:

   ```
   uname -r  # Should show linux-surface kernel
   ```

3. Test Hardware: Verify touchscreen, pen, and other Surface features
   work correctly

## Troubleshooting

- Repository Errors: Ensure internet connectivity and that GPG keys are
  properly imported
- Package Conflicts: The Surface kernel may conflict with standard
  kernels
- Hardware Issues: Some Surface features may require additional
  configuration per device model

## License

See the main repository LICENSE.md file.
