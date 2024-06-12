# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ~/.zshrc
#

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

########### PLUGINS

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

zinit light zsh-users/zsh-autosuggestions
bindkey -e

zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git

zinit cdreplay -q

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color $realpath"
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "ls --color $realpath"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

########### END

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions
alias ls='lsd --color=auto'
alias grep='grep --color=auto'
alias shut='sudo shutdown now'
alias rb='sudo reboot'

# Export locale settings
export LC_ALL=C.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8

# Run neofetch only when the terminal is alacritty
if [[ "$TERM" == "alacritty" ]]; then
    (cat ~/.cache/wal/sequences &)
    source ~/.cache/wal/colors-tty.sh

    export SHELL="/usr/bin/zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
