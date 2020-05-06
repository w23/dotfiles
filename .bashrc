if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

. /etc/profile

PATH=~/.local/bin:$PATH

export HISTSIZE=4096
export HISTCONTROL=ignoreboth

alias l="ls -lA"

set -o vi
