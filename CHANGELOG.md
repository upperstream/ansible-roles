# Changelog

## [Unreleased][]

* Added
  * [base](base/README.md): Add support for installation of AUR helper
    on Arch Linux hosts
  * [desktop](desktop/README.md): Add support for installation of
    desktop tools and web browsers on Artix Linux host
  * [development](development/README.md): Add support for GitHub CLI
    installation Arch Linux hosts
  * [packer](packer/README.md): Add support for Packer installation on
    Arch Linux hosts
  * [remote_access_server](remote_access_server/README.md): Add support
    for installation of xrdp on Arch Linux hosts
  * [virtualisation](virtualisation/README.md):
    * Add support on Artix Linux host for
      * enabling KVM
      * installation of Vagrant
    * Add support for installation of VMware workstation on Arch Linux
      hosts

* Changed:
  * [desktop](desktop/README.md): Use
    [kewlfft.aur.aur](https://github.com/kewlfft/ansible-aur) Ansible
    module to install tools on Arch Linux hosts

## [20240819][]

* Added
  * Add `CHANGELOG.md` file
  * Add [remote_access_server](remote_access_server/README.md) module
    to install remote access servers such as `xrdp`
  * [desktop](desktop/README.md): Add support for dwm installation with
    applying patches
  * [virtualisation](virtualisation/README.md): Add support for
    installation of KVM to Red Hat hosts
  * [virtualisation](virtualisation/README.md): Add support for
    installation of VirtualBox to Red Hat hosts

* Changed
  * [desktop](desktop/README.md): Add more documentation of the module
  * [development](development/README.md): Add support for installation
    of Visual Studio Code on Red Hat hosts
  * [packer](packer/README.md): Add support for Fedora host

[Unreleased]: https://github.com/upperstream/ansible-roles/compare/20240819...HEAD
[20240819]: https://github.com/upperstream/ansible-roles/releases/tag/20240819
