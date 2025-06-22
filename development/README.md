# Development

Enable development tools on the target host.

This role can install the following tools if any is specified in
`development_tools` variable:

* `bcompare` - Beyond Compare
* `gcm` - Git Credential Manager
* `gh` - GitHub CLI
* `git` - Git
* `got` - [Game of Trees][]
* `java` - OpenJDK
* `markdown` - Markdown parser
* `repo` - The [Multiple Git Repository Tool][]
* `vscode` - [Visual Studio Code][] on FreeBSD, Debian hosts, and Red
  Hat hosts

Also the following tools are installed:

* `build-essential` (on Debian and its descendants)

[Game of Trees]: https://gameoftrees.org/index.html
[Multiple Git Repository Tool]: https://gerrit.googlesource.com/git-repo/
[Visual Studio Code]: https://code.visualstudio.com/

## Game of Trees daemons

If the target host is OpenBSD and `development_tools` variable contains
any of:

* `gotd` - Game of Trees Git repository server
* `gotwebd` - Game of Trees repository web frontend

daemons are installed and enabled on the target host.  You may need to
provide configuration files (`files/{{ ansible_hostname }}/gotd.conf`
for `gotd`) and (`files/{{ ansible_hostname }}/gotwebd.conf` for
`gotwebd`).  You may also need HTTPd configuration file
(`files/{{ ansible_hostname }}/gotwebd_httpd.conf`) when you set up `gotwebd`.

## OpenJDK

The variable `jdk`, defaults to `temurin` for macOS or `openjdk-17-jdk`
for others, specifies the package name to install.

## Android development environment

If a list `android_tools` is defined, this role also installs Android
develop environment depending on its elements:

* `android-studio` - [Android Studio][]
* `aosp` - [AOSP][] source code and tools
* `cuttlefish` - [Android Cuttlefish][]
* `platform-tools` - [Android SDK][] platform tools
* `sdktools` - Android SDK command line tools

Tools are installed in `target_user`'s home directory.

[Android Cuttlefish]: https://source.android.com/docs/devices/cuttlefish
[Android SDK]: https://developer.android.com/tools
[Android Studio]: https://developer.android.com/studio
[AOSP]: https://source.android.com/

### Android Studio

Unattended installation is supported on Ubuntu and macOS only.

### AOSP

If the variable `aosp_dir` is defined, it instructs the directory that
AOSP source code is downloaded in.

### Android SDK command line tools

Variables `android_sdk_cmdline_tools_version` specifying the tools
version and `android_sdk_cmdline_tools_checksum` specifying the install
package's SHA256 sum must be defined.
