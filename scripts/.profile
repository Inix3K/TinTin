# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add scripts folder to PATH env variable
PATH=$PATH:$HOME/.scripts

# Aliases for 3k and 3s reconnecting screens with rcc script
alias 3k='trcc 3k'
alias 3s='trcc 3s'
alias 3kx='trcx 3k'
alias 3sx='trcx 3s'
alias tt='tt++ ~/.tt/.tinrc'

export PATH
