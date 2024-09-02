# Base role

## Summary

The `base` role configures the basic features of the target host.

## Variables

* `base` - List of basic capabilities of the target host:
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

[How do I generate encrypted passwords for the user module]:
  https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module
