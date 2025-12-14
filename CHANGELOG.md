# Changelog

## [Unreleased]

* Fixed
  * [remote_access_server](remote_access_server/README.md): Fix
    indentation in variable declaration for startwm_sh_file in xrdp task.

## [20251024][]

* Added
  * Add [ai_stuff](ai_stuff/README.md) role, which installs
    [Claude Code][], [Gemini CLI][], and [OpenCode from charm.sh][]
  * [base](base/README.md): Add support for Windows
  * [desktop](desktop/README.md): Add support for [Xfce][] installation
    on Debian family hosts and OpenBSD family hosts
  * [development](development/README.md): Add support for [Beyond
    Compare][] on Debian family hosts and Windows hosts
  * development: Add support for Windows to install [GitHub CLI][] and
    [Visual Studio Code][]
  * Add [node](node/README.md) role to install [Node.js][] using [nvm][].
  * [packer](packer/README.md): Add support for Windows
  * [virtualisation](virtualisation/README.md): Add support for Windows
    to install [Hyper-V][], [Vagrant][] and [VirtualBox][]

[Beyond Compare]: https://www.scootersoftware.com/
[Claude Code]: https://docs.anthropic.com/en/docs/claude-code/overview
[Gemini CLI]: https://github.com/google-gemini/gemini-cli
[GitHub CLI]: https://cli.github.com/
[Hyper-V]: https://learn.microsoft.com/windows-server/virtualization/hyper-v/
[Node.js]: https://nodejs.org/
[nvm]: https://github.com/nvm-sh/nvm
[OpenCode from charm.sh]: https://github.com/opencode-ai/opencode
[Vagrant]: https://developer.hashicorp.com/vagrant
[VirtualBox]: https://www.virtualbox.org/ "Oracle VirtualBox"
[Visual Studio Code]: https://code.visualstudio.com/
[Xfce]: https://www.xfce.org/

## [20250618][]

* Added
  * [desktop](desktop/README.md): Add support for OpenBSD to set up dwm
  * [docker_host](docker_host/README.md): Add support for Devuan and
    macOS
  * [virtualisation](virtualisation/README.md): Refactor KVM and
    Vagrant installation tasks for clarity and consistency
  * [wireguard](wireguard/README.md): Add role for setting up WireGuard

## [20250412][]

* Added
  * Add `sound` role for configuring audio playback features
  * [base](base/README.md) Add tasks for macOS:
    * to bootstrap configuration
    * to install miscellaneous GUI tools
  * [desktop](desktop/README.md): Add support for installing web
    browsers on macOS
  * [development](development/README.md): Add support for installing
    tools on macOS:
    * [Android SDK][] command line tools
    * [Android Studio][]
    * OpenJDK
    * [repo][]
    * [Visual Studio Code][]
  * [packer](packer/README.md): Add support for Devuan
  * [virtualisation](virtualisation/README.md): Add support for macOS
* Changed
  * desktop: Change variable name for [Firefox][] without Snap from
    `firefox_without_snap` to `firefox`.  This implies that the role
    prefers non- Snap version on Firefox over Snap version.
  * development: Refactory for [Game of Trees][] configuration

[Android SDK]: https://developer.android.com/tools
[Android Studio]: https://developer.android.com/studio
[Firefox]: https://www.mozilla.org/firefox/
[Game of Trees]: https://gameoftrees.org/index.html
[repo]: https://gerrit.googlesource.com/git-repo/

## [20250212][]

* Added
  * Add [cuda](cuda/README.md) role to install CUDA on Debian hosts
  * Add [docker_host](docker_host/README.md) role to set up docker host
    on Debian hosts
  * Add support for executing roles on macOS.  This introduces a
    variable `false_for_macos`, which should be set to `false` when
    roles are executed against macOS hosts.  This ensures that package
    installation is performed by a normal user on macOS, where the
    `ansible.builtin.package` module relies on [Homebrew][] for package
    management.
  * [base](base/README.md): Add support to configure the hostname of
    the target host

[Homebrew]: https://brew.sh/
    "Homebrew — The Missing Package Manager for macOS (or Linux)"

## [20241108][]

* Added
  * [base](base/README.md): Add support for:
    * arbitrary packages installation
    * configuring NFS client functionality on FreeBSD and Linux hosts
  * [desktop](desktop/README.md): Add support for installation of
    [Cinnamon][] desktop and [KDE Plasma][] desktop on FreeBSD host
* Changed
  * [desktop](desktop/README.md): [dwm][] was installed using
    distribution package even if another version built from source code
    was installed
  * [packer](packer/README.md): Use binary package of [Packer][] on
    FreeBSD host instead of the official package from Packer website
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
[Packer]: https://www.packer.io/ "Packer by HashiCorp"

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

[kewlfft.aur.aur]: https://github.com/kewlfft/ansible-aur
[Proxmox VE]: https://www.proxmox.com/en/proxmox-virtual-environment/overview

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

[Unreleased]:
  https://github.com/upperstream/ansible-roles/compare/20251024...HEAD
[20251024]:
  https://github.com/upperstream/ansible-roles/compare/20250618...20251024
[20250618]:
  https://github.com/upperstream/ansible-roles/compare/20250412...20250618
[20250412]:
  https://github.com/upperstream/ansible-roles/compare/20250212...20250412
[20250212]:
  https://github.com/upperstream/ansible-roles/compare/20241108...20250212
[20241108]:
  https://github.com/upperstream/ansible-roles/compare/20241002...20241108
[20241002]:
  https://github.com/upperstream/ansible-roles/compare/20240819...20241002
[20240819]:
  https://github.com/upperstream/ansible-roles/releases/tag/20240819
