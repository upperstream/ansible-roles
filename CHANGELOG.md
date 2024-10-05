# Changelog

## [Unreleased][]

* Added
  * [base](base/README.md): Add support for arbitrary packages
    installation
  * [desktop](desktop/README.md): Add support for installation of
    [Cinnamon][] desktop and [KDE Plasma][] desktop on FreeBSD host
* Changed
  * [desktop](desktop/README.md): [dwm][] was installed using
    distribution package even if another version built from source code
    was installed
  * [remote_access_server](remote_access_server/README.md): Copy
    `startwm.sh` script into every target user's home directory on the
    target host if the script exists in `files/{{ target_host }}`
    directory
  * [virtualisation](virtualisation/README.md): Skip compilation of
    [VirtualBox][] kernel driver on non- Linux hosts

[Cinnamon]: https://projects.linuxmint.com/cinnamon/
    "Linux Mint Projects by linuxmint"
[dwm]: https://dwm.suckless.org/
[KDE Plasma]: https://kde.org/plasma-desktop/ "KDE Plasma Desktop"
[VirtualBox]: https://www.virtualbox.org/ "Oracle VirtualBox"

## [20241002][]

* Added
  * [base](base/README.md): Add support for installation of AUR helper
    on Arch Linux hosts
  * [desktop](desktop/README.md): Add support for installation of
    desktop tools and web browsers on Artix Linux host
  * [development](development/README.md):
    * Add support for GitHub CLI installation Arch Linux hosts
    * Add support for [Game of Trees][] installation on OpenBSD host
    * Add support for [Visual Studio Code][] installation on FreeBSD
      host
  * [packer](packer/README.md): Add support for Packer installation on
    Arch Linux hosts
  * [remote_access_server](remote_access_server/README.md): Add support
    for installation of xrdp on Arch Linux hosts
  * [virtualisation](virtualisation/README.md):
    * Add support on Artix Linux host for
      * enabling KVM
      * installation of Vagrant and VirtualBox
    * Add support for installation of VMware workstation on Arch Linux
      hosts
    * Add support for [Proxmox VE][] installation on Debian host
* Changed:
  * [desktop](desktop/README.md): Use [kewlfft.aur.aur][] Ansible
    module to install tools on Arch Linux hosts

[Game of Trees]: https://gameoftrees.org/index.html
[kewlfft.aur.aur]: https://github.com/kewlfft/ansible-aur
[Proxmox VE]: https://www.proxmox.com/en/proxmox-virtual-environment/overview
[Visual Studio Code]: https://code.visualstudio.com/

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

[Unreleased]: https://github.com/upperstream/ansible-roles/compare/20241002...HEAD
[20241002]: https://github.com/upperstream/ansible-roles/compare/20240819...20241002
[20240819]: https://github.com/upperstream/ansible-roles/releases/tag/20240819
