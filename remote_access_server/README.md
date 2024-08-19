# Remote Access Server

This module installs remote access server software, such as
[xrdp](https://www.xrdp.org/), on the target host.

Set the variable `remote_access_servers` to contain package names of
remote access servers to install.  If the variable contains `xrdp`, and
`firewalld` is running on the target Red Hat host, firewall rule will
be updated so that incoming connection to RDP port (3389) is allowed.
