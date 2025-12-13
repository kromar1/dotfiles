# export PS1="%~ %# "

bindkey -v

export EDITOR='nvim'
export VISUAL='nvim'

autoload -U edit-command-line
zle -N edit-command-line

bindkey -M vicmd 'v' edit-command-line

alias ll='eza -la --git'

export PATH="/usr/local/sbin:~/.local/bin:$PATH"

eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Usage: Type 'notes' -> Fuzzy select a file -> Opens in Neovim
notes() {
    # CHANGE THIS PATH to where you cloned this repo
    cd ~/dev/cheatsheets && \
    fd --type f | fzf --preview 'glow {}' | xargs nvim
}

export XDG_CONFIG_HOME="$HOME/.config"

