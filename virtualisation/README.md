# Virtualisation

Enable virtualisation features on the target host.

List variable `virtualisations` must contain any of:

* kvm
* vagrant
* virtualbox
* vmware

virtualisation solution to install.

## KVM

This task enables [KVM](https://www.linux-kvm.org/page/Main_Page)
feature and installs [libvirt](https://libvirt.org/) related packages
on the target host.  Specified user listed in `kvm_users` will be added
to `kvm` and `libvirt` groups.

This also installs a utility shell script `kvmctl.sh` on the target
host, which temporarily enables or disables KVM feature.

This task supports installing KVM and libvirt on:

* Arch Linux and Artix Linux,
* Debian and its descendants, or
* Red Hat descendants.

## Vagrant

This task installs Vagrant on the target host.  Vagrant Libvirt provider
is also installed on Linux target host.

## VirtualBox

This task installs [VirtualBox](https://www.virtualbox.org/) on the
target host running Debian descendants, Red Hat descendants, Arch Linux
descendants, or FreeBSD hosts.

## VMware

This task installs VMware Workstation on the target host.  You need to
put VMware installer bundles in `dist_files` directory.  Although you
can put bundles for several versions, the latest version will be
automatically picked up to install.

## Limitations

This role assumes the target host is running either Debian or Ubuntu
unless otherwise stated.
