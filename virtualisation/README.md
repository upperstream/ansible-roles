# Virtualisation

Enable virtualisation features on the target host.

List variable `virtualisations` must contain any of:

* kvm
* vagrant
* virtualbox
* vmware

## KVM

This task enables KVM feature and installs libvirt related packages on
the target host.  Specified user listed in `kvm_users` will be added to
`kvm` and `libvirt` groups.

This also installs a utility shell script `kvmctl.sh` on the target
host, which temporarily enables/disables KVM feature.

In addition to Debian descendants, this task also supports Arch Linux.

## Vagrant

This task installs Vagrant on the target host.  Vagrant Libvirt provider
is also installed on Linux target host.

## VirtualBox

This task installs VirtualBox on the target host running Debian and its
descendants, Arch Linux, or FreeBSD.

## VMware

This task installs VMware Workstation on the target host.  You need to
put VMware installer bundles in `dist_files` directory.  Although you
can put bundles for several versions, the latest version will be
automatically picked up to install.

## Limitations

This role assumes the target host is running either Debian or Ubuntu
unless otherwise stated.

---

Copyright &copy; 2023, 2024 Upperstream.
