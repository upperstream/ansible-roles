# Packer

Installs [Packer][] to the target host.

## Variables

* `archlinux_packer_version` - Packer version number to install to Arch
  Linux hosts

## Limitation

* This task assumes that the target host is running:
  * Arch Linux and Artix Linux,
  * Debian and its descendants,
  * Fedora,
  * FreeBSD, or
  * Windows

[Packer]: https://www.packer.io/ "Packer by HashiCorp"
