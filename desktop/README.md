# Set up desktop environment

This task installs the following software for desktop use.

## Desktop environment

* Choice of desktop environments
* [dwm][] with [st][] and [dmenu][]

Set the variable `desktops` to contain desktop environment packages to
install.  If the variable `dwm_patches` is defined, dwm will be
compiled from its source code with applying patches listed in
`dwm_patches`.

## Mail client

* Choice of mail clients

Set the variable `mailers` to contain package names of email clients to install.

## Web browser

* Choice of web browsers (OS/distribution's packages)
* [Firefox][] without Snap
* [Google Chrome][]

Set the variable `browsers` to contain package names of web browsers to install.

## Font

* Choice of fonts

Set the variable `fonts` to contain package names of fonts to install.

[dmenu]: https://tools.suckless.org/dmenu/
[dwm]: https://dwm.suckless.org/
[Firefox]: https://www.mozilla.org/firefox/
[Google Chrome]: https://www.google.com/chrome/
[st]: https://st.suckless.org/

- - -

Copyright &copy; 2023, 2024 Upperstream.
