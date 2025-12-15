# export PS1="%~ %# "

bindkey -v

export EDITOR='nvim'
export VISUAL='nvim'

# Press v to edit the command line in Neovim, :wq to get back to terminal
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# To instantly search and open these cheatsheets from anywhere in the terminal, add this function to your `~/.zshrc`:
# Usage: Type 'notes' -> Fuzzy select a file -> Opens in Neovim
notes() {
    cd ~/dev/cheatsheets && \
    rg --color=always --line-number --no-heading --smart-case . | \
    fzf --ansi \
        --exact \
        --delimiter : \
        --nth=3.. \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --preview-window 'right:65%:+{2}/2' \
        --bind 'enter:execute(nvim {1} +{2})' \
        --bind 'ctrl-d:preview-half-page-down' \
        --bind 'ctrl-u:preview-half-page-up' \
        --bind 'ctrl-y:preview-up,ctrl-e:preview-down'
}

alias ll='eza -la --git'
alias n='notes'

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="/usr/local/sbin:~/.local/bin:$PATH"
