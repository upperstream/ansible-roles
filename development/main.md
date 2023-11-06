# Development

Enable development tools on the target host.

This role contains the following features:

* git
* Git Credential Manager
* GitHub CLI
* java - OpenJDK
* markdown

## Android SDK

If a list `android_tools` is defined, this role also installs Android
develop environment depending on its elements:

* `cuttlefish` - Android Cuttlefish
* `platform-tools` - Android SDK platform tools
* `sdktools` - Android SDK command line tools

Tools are installed in `remote_user`'s home directory.

### Android SDK command line tools

Variables `android_sdk_cmdline_tools_version` specifying the tools
version and `android_sdk_cmdline_tools_checksum` specifying the install
package's SHA256 sum must be defined.
