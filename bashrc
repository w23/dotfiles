PATH=~/.local/bin:~/.cargo/bin:$PATH

export EDITOR=vim
export HISTSIZE=4096
export HISTCONTROL=ignoreboth

alias l="eza -l"
alias rm='rm -i'
alias mv='mv -i'
alias diffc='diff --color=always'

source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash

# meh
# set -o vi
