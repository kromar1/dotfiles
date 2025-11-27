export PS1="%~ %# "

bindkey -v

export EDITOR='nvim'
export VISUAL='nvim'

autoload -U edit-command-line
zle -N edit-command-line

bindkey -M vicmd 'v' edit-command-line

alias ll='ls -al'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/usr/local/sbin:~/.local/bin:$PATH"
