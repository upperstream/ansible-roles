# Ansible Role: Node.js

This role installs [Node.js](https://nodejs.org/) using
[Node Version Manager](https://github.com/nvm-sh/nvm) (NVM) for a
specified user.

## Supported Operating Systems

This role has been tested and supports the following operating systems:

* Linux distributions with package managers that support `curl`
* Systems where the target user has a home directory

## Role Variables

### Mandatory Variables

* `target_user`: (String) The username for which Node.js and NVM will be
  installed.

### Optional Variables

* `node_version`: (String) The version of Node.js to install.  Defaults
  to `v22.17.0`.
* `nvm_version`: (String) The version of NVM (Node Version Manager) to
  install.  Defaults to `v0.40.3`.

## Dependencies

* The role requires `curl` to be available, which it will install
  automatically if not present.
* The target user must have a valid home directory.
* The role assumes internet connectivity to download NVM and Node.js.

## Installation Process

The role performs the following steps:

1. **Install curl**: Ensures `curl` is available on the system using the
   system package manager.
2. **Install NVM**: Downloads and installs NVM using the official
   installation script from the NVM repository.
3. **Generate Node.js installer**: Creates a temporary shell script from
   the `install_node.sh.j2` template.
4. **Install Node.js**: Executes the generated script to install the
   specified Node.js version using NVM.

## File Management

* NVM is installed to `~/.nvm/` in the target user's home directory
* Node.js binaries are installed to `~/.nvm/versions/node/{{ node_version }}/bin/`
* A temporary installation script is created at `/tmp/install_node.sh`
  and executed

## Example Playbook

	- hosts: servers
	become: yes
	roles:
		- role: node
		vars:
			target_user: "developer"
			node_version: "v20.10.0"
			nvm_version: "v0.39.0"

## Example Playbook (Minimal)

	- hosts: servers
	become: yes
	roles:
		- role: node
		vars:
			target_user: "myuser"

**Note:** The role will automatically install the default Node.js
version (v22.17.0) and NVM version (v0.40.3) if not specified.

## Usage After Installation

After the role completes, the target user can:

* Use NVM commands: `nvm list`, `nvm use <version>`,
  `nvm install <version>`
* Access Node.js and npm directly (the installed version will be
  available in PATH)
* Install additional Node.js versions using NVM

To use NVM in shell sessions, the target user should ensure their shell
profile sources the NVM script:

	# This is typically added automatically by the NVM installer
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## Idempotency

The role is designed to be idempotent:

* NVM installation is skipped if `~/.nvm/nvm.sh` already exists
* Node.js installation is skipped if the specified version is already
  installed at the expected path
