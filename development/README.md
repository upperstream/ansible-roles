# Development

Enable development tools on the target host.

This role can install the following tools if any is specified in
`development_tools` variable:

* gcm - Git Credential Manager
* gh - GitHub CLI
* git
* java - OpenJDK
* markdown
* repo
* vscode - Visual Studio Code (on Debian and its descendants)

Also the following tools are installed:

* `build-essential` (on Debian and its descendants)

## Android development environment

If a list `android_tools` is defined, this role also installs Android
develop environment depending on its elements:

* `android-studio` - Android Studio
* `aosp` - AOSP source code and tools
* `cuttlefish` - Android Cuttlefish
* `platform-tools` - Android SDK platform tools
* `sdktools` - Android SDK command line tools

Tools are installed in `target_user`'s home directory.

### Android Studio

Unattended installation is supported on Ubuntu only.

### AOSP

If the variable `aosp_dir` is defined, it instructs the directory that
AOSP source code is downloaded in.

### Android SDK command line tools

Variables `android_sdk_cmdline_tools_version` specifying the tools
version and `android_sdk_cmdline_tools_checksum` specifying the install
package's SHA256 sum must be defined.
