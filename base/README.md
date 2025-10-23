# Base role

## Summary

The `base` role configures the basic features of the target host.

## Variables

* `base` - List of basic capabilities of the target host:
  * `hostname` - Set the hostname of the target host if defined.
    Windows is not supported
  * `nfs_client` - Set up NFS client functionality and mount NFS server
    exports (FreeBSD and Linux hosts are supported.)
  * `zfs` - Install ZFS utilities to mount ZFS file systems (FreeBSD
    host and Systemd-enabled Linux host are supported.)
* `archlinux_pacman_wrapper` - AUR helper to install on Arch Linux
  target hosts.  See the main [README.md](../README.md) for details.
* `users_to_create` - Create users on the target host with the
  following attributes:
  * `name` - Login name of this user.
  * `group` - Primary group of this user.  The default group will be
    assigned if this value is lacked.
  * `groups` - Additional groups that this user is invited to.
  * `append` - If `true`, this user will be invited to `groups` in
    addition to current groups, otherwise this user will be a member of
    only groups in `groups` and will be excluded from current groups.
  * `password` - Login password of this user, which must be encrypted
    in accordance to the remote host's password specification.  See
    _[How do I generate encrypted passwords for the user module][]_ for
    details.
* `zfs_load_keys`- List of ZFS dataset to load encryption keys for
  at boot.  On FreeBSD host, this variable is a dictionary of dataset
  to key location pairs.  On Linux host, this variable is a list of
  dataset.
* `misc_tools` - List of miscellaneous packages to install.
* `misc_gui_tools` - List of miscellaneous GUI packages to install with
  `brew install --cask`, for macOS hosts only.
* `shell_profile` - See next section.

## Bootstrap for macOS hosts

* When `base` role is assigned to macOS hosts, [macos](tasks/macos.yml)
  tasks will be automatically executed.  This ensures that:

  * [Homebrew][] is installed on the target host.
  * Update the file that a variable `shell_profile` points to so that
    PATH includes the location of Homebrew commands.
  * Interactively ask the operator for BECOME password.  This will
    define [`ansible_become_password`][] variable and set it to the
    user provided password, which can be used as the `sudo_password`
    for [`community.general.homebrew_cask`][] module.

## Bootstrap for Windows hosts

* When `base` role is assigned to Windows hosts, [windows](tasks/windows.yml)
  tasks will be automatically executed.  This ensures that:

  * Execution Policy is updated so that Chocolatey script can be
    executed.
  * [Chocolatey][] client is installed.

[`ansible_become_password`]: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_privilege_escalation.html#become-connection-variables
    "Understanding privilege escalation: become"
[Chocolatey]: https://docs.chocolatey.org/en-us/choco/setup/
[`community.general.homebrew_cask`]: https://docs.ansible.com/ansible/latest/collections/community/general/homebrew_cask_module.html
    "community.general.homebrew_cask module &ndash; Install and uninstall homebrew casks"
[How do I generate encrypted passwords for the user module]:
  https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module
    "How do I generate encrypted passwords for the user module?"
[Homebrew]: https://brew.sh/
    "Homebrew &mdash; The Missing Package Manager for macOS (or Linux)"
