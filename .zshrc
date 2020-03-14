#          _           _       _    __ _ _           
#  _______| |__     __| | ___ | |_ / _(_) | ___  ___ 
# |_  / __| '_ \   / _` |/ _ \| __| |_| | |/ _ \/ __|
#  / /\__ \ | | | | (_| | (_) | |_|  _| | |  __/\__ \
# /___|___/_| |_|  \__,_|\___/ \__|_| |_|_|\___||___/
#                                                  
# Sourcing Antigen.zsh
source ~/.zsh/antigen.zsh

# Initialize Oh-my-zsh
antigen use oh-my-zsh

# == Themes ==
# Themes list:
# denysdovhan/spaceship-zsh-theme spaceship
# geometry-zsh/geometry
# skylerlee/zeta-zsh-theme
# caiogondim/bullet-train.zsh
# halfo/lambda-mod-zsh-theme
# zthxxx/jovial
# saleh7/igeek-zsh-theme
# eendroroy/alien alien
# tobyjamesthomas/pi
THEME="zthxxx/jovial"
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi

# == Plugins ==
# OS
antigen bundle ubuntu
#antigen bundle archlinux
# Utilites
antigen bundle command-not-found
antigen bundle web-search
antigen bundle sudo 
antigen bundle jsontools
antigen bundle gpg-agent
# Git
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
antigen bundle github
antigen bundle git-remote-branch
antigen bundle gitignore
# Completion
antigen bundle gem
antigen bundle pip
antigen bundle heroku
# Aliases
antigen bundle common-aliases
antigen bundle compleat
antigen bundle yarn
antigen bundle docker
antigen bundle docker-compose
antigen bundle dotenv
antigen bundle emoji
antigen bundle gulp
antigen bundle npm
antigen bundle node
antigen bundle nmap
antigen bundle z
antigen bundle systemd
antigen bundle vscode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# == Antigen Apply ==
antigen apply

# Env Variables
source $HOME/.env

# == Aliases ==
# Config i3 Aliases
#alias vfi='vim $HOME/.config/i3/config'
#alias cfi='code $HOME/.config/i3/config'

# Config zsh aliases
#alias vzsh='vim $HOME/.zshrc'
#alias czsh='code $HOME/.zshrc'
#alias szsh='source $HOME/.zshrc'

# Config Polybar
#alias chpl='cd $HOME/.config/polybar/'
#alias vpl='vim $HOME/.config/polybar/config'
#alias plbr='$HOME/.config/polybar/launch.sh'

# Dotfiles Managing
alias dotfiles='/usr/bin/git --git-dir=/home/keivan/.dotfiles/ --work-tree=/home/keivan'

# nmcli Aliases
#alias nmcli_list='nmcli device wifi list'
#alias nmcli_rescan='nmcli device wifi rescan'
#alias nmcli_connect='echo "nmcli device wifi connect SSID password PASSWORD"'

# Other Aliases
#eval $(thefuck --alias)
