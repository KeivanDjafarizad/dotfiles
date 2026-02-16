# Oh my zsh conf
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="duellj"

zstyle ':omz:update' mode auto

plugins=(
	git 
	docker 
	sudo
	dotenv
	emoji
	laravel
)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Alias
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse --preview="bat --color=always --style=numbers" | xargs nvim'
alias zshconfig="nvim ~/.zshrc"
alias vim="nvim"
alias pip="pip3"
alias pythom="python3"

## eza 
alias ls="eza"
alias la="eza -lag"

## bat
alias cat="bat"

export PATH="$HOME/.local/bin:$PATH"

# NVM Import
export NVM_DIR="/opt/homebrew/opt/nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# Bat Config
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"
export BAT_CONFIG_DIR="$HOME/.config/bat"

# opencode
export PATH=/Users/keivandjafarizad/.opencode/bin:$PATH

bindkey "^X^E" edit-command-line

# zoxide
eval "$(zoxide init zsh)"
