#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Run startx at login on tty1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
then
    startx
fi

# Run Hyprland at login on tty2
if [[ -z $DISPLAY && $XDG_VTNR -eq 2 ]]
then
    Hyprland
fi
