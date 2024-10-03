# Remote Access Server

This module installs remote access server software, such as
[xrdp](https://www.xrdp.org/), on the target host.

## Variables

* `remote_access_servers` - Package names of remote access servers to
  install.  If the variable contains `xrdp`, and `firewalld` is running
  on the target Red Hat host, firewall rule will be updated so that
  incoming connection to RDP port (3389) is allowed.

## Window manager startup script for xrdp

`xrdp-sesman` will execute the script ${HOME}/startwm.sh if it exists
in order to start up the window manager.  This role will copy the
script, if it exists, in `file/{{ target_host }}` directory into the
every `{{ users }}`'s home directory on the target host.
