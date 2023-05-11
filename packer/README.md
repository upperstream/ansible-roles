# Packer

Installs Packer to the target host.

## Limitation

* This task assumes that the target host is running Debian or Ubuntu.
* If the target host is running Debian bookworm; distro's package,
  which is older, will be installed instead of HashiCorp's package.
