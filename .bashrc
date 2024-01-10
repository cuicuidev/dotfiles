#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nv='nvim'
alias shut='sudo shutdown now'
alias rb='sudo reboot'

PS1='[\u@\h \W]\$ '

export LC_ALL=C.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

# Run neofetch only when the terminal is alacritty
if [ "$TERM" = "alacritty" ]; then
	(cat ~/.cache/wal/sequences &)
	source ~/.cache/wal/colors-tty.sh

	neofetch
fi
