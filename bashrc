# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
setxkbmap -layout br
setxkbmap -option caps:escape
export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\W\[\e[0m\]\$ '
