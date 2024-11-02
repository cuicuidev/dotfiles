#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd --color=auto'
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

########################## CD with venv

find_venv() {
  local dir="$1"
  while [[ "$dir" != "/" ]]; do
    venv_dirs=("$dir"/venv*)  # Array of matching directories
    for venv_dir in "${venv_dirs[@]}"; do
      if [[ -d "$venv_dir" ]]; then
        echo "$venv_dir"
        return
      fi
    done
    dir=$(dirname "$dir")
  done
  while IFS= read -r -d '' venv_dir; do
    if [[ -d "$venv_dir" ]]; then
      echo "$venv_dir"
      return
    fi
  done < <(find "$dir" -name 'venv*' -print0)
}

# Function to change directory and handle venv activation/deactivation
cs() {

    if [[ -z "$1" ]]; then
        builtin cd ~ || return
    else
        # Change to the target directory
        builtin cd "$1" || return
    fi

    # Deactivate any currently active virtual environments
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    # Find the closest venv in the new directory
    venv_path=$(find_venv "$PWD")
    if [[ -n "$venv_path" ]]; then
        source "$venv_path/bin/activate"
    fi
}

# Alias the function
alias cd='cs'
