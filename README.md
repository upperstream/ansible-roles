# Ansible Roles

## Usage

You should configure [roles_path](http://docs.ansible.com/ansible/latest/intro_configuration.html#roles-path)
value in your Ansible configuration file so that Ansible can locate
this directory.

## Variables

Some role definitions refer to variables.  You need to supply actual
values for them using such as `host_vars` or `group_vars` files.  See
`README.md` file in each role for further information.

The variable `false_for_macos_and_windows` should be set to `false` when
executing roles against macOS hosts and Windows hosts, on the other hand
`true` for other OS families.  This variable controls whether the
`ansible.builtin.package` module installs packages as a privileged user.
On macOS it uses [Homebrew](https://brew.sh/) for package management,
and on Windows it uses [Chocolatey](https://chocolatey.org/) for package
management; both should be executed by a normal user.

## Note for Arch Linux and descendants

In order for Arch Linux family to use AUR as well as the official
repository, role definitions depend on
[kewlfft.aur](https://github.com/kewlfft/ansible-aur) Ansible
collection with any of AUR helper compatible to `pacman`.  The
`kewlfft.aur` collection needs to be installed on the Ansible
controller, an AUR helper needs to be installed on the target host, and
the helper name needs to be set to the variable
`archlinux_pacman_wrapper`.

The ansible user should be allowed to invoke `sudo pacman` without
a password.  See the _[Create the "aur_builder" user](https://github.com/kewlfft/ansible-aur#create-the-aur_builder-user)_
section of the `kewlfft.aur` document for details.

The [base](base/README.md) role can install any of the following AUR
helper on Arch Linux target hosts by setting `archlinux_pacman_wrapper`
variable:

* [aura](https://aur.archlinux.org/packages/aura)
* [aurman](https://aur.archlinux.org/packages/aurman)
* [pacaur](https://aur.archlinux.org/packages/aurman)
* [pakku](https://aur.archlinux.org/packages/pakku)
* [paru](https://aur.archlinux.org/packages/paru)
* [pikaur](https://aur.archlinux.org/packages/pikaur)
* [trizen](https://aur.archlinux.org/packages/trizen)
* [yay](https://aur.archlinux.org/packages/yay),

while `kewlfft.aur.aur` Ansible module supports `yay`, `paru`,
`pacaur`, `trizen`, `pikaur`, and `aurman`.

## Licensing

This software is provided under the terms of
[ISC License](http://www.isc.org/downloads/software-support-policy/isc-license/).
