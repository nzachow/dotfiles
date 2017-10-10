# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nicolas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZSH=/usr/share/oh-my-zsh/

setxkbmap -layout br
setxkbmap -option caps:escape

export GOPATH=$HOME/Prog/go/
export PATH=$PATH:$GOPATH/bin

# export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\$ '
# set -o vi
fortune | cowsay
export EDITOR='/usr/bin/nvim'
~/.vocab
alias ll="ls -hal"
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh
