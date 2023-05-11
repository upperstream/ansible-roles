# Virtualisation

Enable virtualisation features on the target host.

List variable `virtualisations` must contain any of:

* kvm
* vmware

## KVM

`kvm` task enables KVM feature and installs libvirt related packages on
the target host.  Specified user listed in `kvm_users` will be added to
`kvm` and `libvirt` groups.

## VMware

This task installs VMware Workstation on the target host.  You need to
put VMware installer bundles in `dist_files` directory.  Although you
can put bundles for several versions, the latest version will be
automaticallyp picked up to install.

## Limitations

This role assumes the target host is running either Debian or Ubuntu.

---

Copyright &copy; 2023 Upperstream.
