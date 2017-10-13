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

xmodmap -e "clear Mod4"
xmodmap -e "keycode 133 = ISO_Level3_Shift"
xmodmap -e "keycode  45 = k K k K Up ampersand kra"
xmodmap -e "keycode  44 = j J j J Down"
xmodmap -e "keycode  43 = h H h H Left"
xmodmap -e "keycode  46 = l L l L Right"

export GOPATH=$HOME/Prog/go/
export PATH=$PATH:$GOPATH/bin

# export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\$ '
# set -o vi
fortune | cowsay
export EDITOR='/usr/bin/nvim'
~/.vocab
alias ll="ls -hal"
ZSH_THEME="agnoster"

plugin=(git npm)
source $ZSH/oh-my-zsh.sh
