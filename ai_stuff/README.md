# Ansible Role: AI Stuff

This role is designed to set up AI related stuff.

## Role Overview

The `ai_stuff` role is an Ansible module responsible for installing and
AI related stuff.

## Supported Operating Systems

This role is designed to work on:

- Linux (tested primarily with Debian/Ubuntu)
- Other Unix-based systems may require manual adjustments

## Role Variables

### Optional Variables

While there are no mandatory variables, you can customize the
installation by setting:

- `ai_stuff`: A list of components to install.  Candidates are the
  following:
  - `charm_opencode`: [OpenCode from charm.sh][] and its dependencies
  - `claude_code`: [Claude Code][] and its dependencies
  - `gemini_cli`: [Gemini CLI][] and its dependencies

## Example Playbook

Here's an example playbook to use this role:

	- hosts: servers
	  become: yes
	  roles:
	    - ai_stuff

If you want to install Claude Code, Gemini CLI, and OpenCode from Charm:

	- hosts: server
	  become: yes
	  vars:
	    ai_stuff:
	      - charm_opencode
		  - claude_code
		  - gemini_cli
	    roles:
	      - ai_stuff

## Notes

- This role assumes that the target system has direct access to the
  internet for downloading packages.
- The installation paths may vary based on your environment and system
  configuration.

[Claude Code]: https://docs.anthropic.com/en/docs/claude-code/overview
[Gemini CLI]: https://github.com/google-gemini/gemini-cli
[OpenCode from charm.sh]: https://github.com/opencode-ai/opencode
