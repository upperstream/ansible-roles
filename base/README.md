# Base role

## Summary

The `base` role configures the basic features of the traget host.

## Variables

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

[How do I generate encrypted passwords for the user module]:
  https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module
