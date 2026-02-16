# Dropbox role

## Summary

The `dropbox` role installs Dropbox Desktop client on the target host.

## Supported Platforms

* Debian-based Linux distributions (Debian, Ubuntu)
* Architecture: amd64 (x86_64)

## Variables

* `dropbox_desktop` - Boolean flag to control whether Dropbox Desktop
  should be installed.  Set to `true` to install Dropbox Desktop.
  Default: not set (role will not install anything unless explicitly
  enabled).

* `dropbox_desktop_version` - The version of Dropbox Desktop client to
  install.  This corresponds to the release version from Dropbox.
  Default: `2026.01.15`

## Usage

To use this role, include it in your playbook and set the
`dropbox_desktop` variable to `true`:

    - hosts: desktop_hosts
      roles:
        - role: dropbox
          vars:
            dropbox_desktop: true

## What This Role Does

When `dropbox_desktop` is set to `true`, this role will:

1. Validate that the target host is running a supported OS (Debian or
   Ubuntu).  The role will fail with an error message if the OS is not
   supported.
2. Download and install the Dropbox Desktop client package directly from
   Dropbox's official repository
3. Install the appropriate package for your system architecture (amd64)
4. Use the latest version available (currently 2026.01.15)

## Requirements

* Target host must be running a Debian-based Linux distribution (Debian
  or Ubuntu)
* Target host must have internet connectivity to download the package
  from `linux.dropbox.com`
* Elevated privileges (become/sudo) are required for package
  installation

## Notes

* The role automatically detects the OS family and architecture to
  download the correct package
* Only Debian and Ubuntu distributions are currently supported
