dots
====

My public dotfiles, and a script to bootstrap them.

bootstrap.sh
------------

The `bootstrap.sh` script links everything in the dots repository to corresponding files or directories in your `$HOME`, as-is, with a dot prepended. The following special files/directories are not considered:

* `bootstrap.sh`
* `README.md`
* `os/`
* `host/`

os and host directories
-----------------------

The `os/` and `host/` directories are not directly symlinked. Instead, they are inspected for subdirectories that match `uname` and `hostname`. If a match is found, files and directories in that subdirectory are symlinked into your `$HOME`. The order of precedence for conflicting files or directores are as follows, from most to least specific:

1. Files and directories within `host/`
1. Files and directories within `os/`
1. Files and directories at the root of the repository

For a given host `example`, running OS `Darwin`, the file `host/example/gitconfig` will win out over `os/darwin/gitconfig` and `gitconfig`.

