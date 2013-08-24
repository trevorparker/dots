dots
====

My public dotfiles, and a script to bootstrap them.

bootstrap.sh
------------

A pretty simple script that takes everything here (aside from itself) and symlinks to appropriate dot files in your home directory.

It does special handling of the `os/` directory depending on your system. Simply, if `uname` matches a directory within `os/`, then files in that directory are symlinked. Otherwise they're ignored. This is powerful for having some files on some machines, but not others, in cases where those files can't be intelligently scripted on their own.
