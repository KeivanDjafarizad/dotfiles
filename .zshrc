# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh my zsh conf
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

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

export PATH="$HOME/.local/bin:$HOME/.composer/vendor/bin:$PATH"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
