# Base role

## Summary

The `base` role configures the basic features of the target host.

## Variables

* `base` - List of basic capabilities of the target host:
  * `zfs` - Install ZFS utilities to mount ZFS file systems (Only Linux
    host is supported.)
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
* `zfs_load_keys`- List of ZFS file systems to load encryption keys for
  at boot.  `/` character in the file system name will be automatically
  escaped. (Only Linux host with Systemd is supported.)

[How do I generate encrypted passwords for the user module]:
  https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module
