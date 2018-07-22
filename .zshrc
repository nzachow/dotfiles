# Keyboard setup
setxkbmap -layout br
# Map caps to esc
setxkbmap -option caps:escape
xmodmap -e "clear Mod4"
xmodmap -e "keycode 133 = ISO_Level3_Shift"
xmodmap -e "keycode  45 = k K k K Up ampersand kra"
xmodmap -e "keycode  44 = j J j J Down"
xmodmap -e "keycode  43 = h H h H Left"
xmodmap -e "keycode  46 = l L l L Right"

# Golang
export GOPATH=$HOME/Prog/go/
export PATH=$PATH:$GOPATH/bin

# ZSH configs ####################
## History
HISTCONTROL=erasedups
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
## Don't beep
unsetopt beep
## Rename files with regex
autoload -U zmv
alias mmv='noglob zmv -W'
## ZSH in VI-mode
set -o vi
## Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH configs ####################

export EDITOR='/usr/bin/nvim'
alias ll="ls -hal"
# Show pending tasks
task status:pending list

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# PL9k configs
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_last"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context tw dir newline vcs vi_mode )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DEFAULT_USER="nicolas"
