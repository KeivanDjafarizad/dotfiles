#          _           _       _    __ _ _           
#  _______| |__     __| | ___ | |_ / _(_) | ___  ___ 
# |_  / __| '_ \   / _` |/ _ \| __| |_| | |/ _ \/ __|
#  / /\__ \ | | | | (_| | (_) | |_|  _| | |  __/\__ \
# /___|___/_| |_|  \__,_|\___/ \__|_| |_|_|\___||___/
#
# Author: Keivan Djafarizad
# Description: Zsh dotfiles powered by antigen and set up for a lot of plugins, 
# mostly never properly used
# URL: https://github.com/KeivanDjafarizad/dotfiles
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
antigen bundles <<EOBUNDLES
    # OS
    ubuntu
    #archlinux
    # Utilites
    command-not-found
    web-search
    sudo 
    jsontools
    gpg-agent
    alexandergood/oh-my-zsh plugins/nordvpn
    # Git
    git
    git-extras
    git-flow
    github
    git-remote-branch
    gitignore
    # Completion
    gem
    pip
    heroku
    # Aliases
    common-aliases
    compleat
    yarn
    docker
    docker-compose
    dotenv
    emoji
    gulp
    npm
    node
    nmap
    z
    systemd
    vscode
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOBUNDLES

# == Antigen Apply ==
antigen apply

# Env Variables
# Write them into .zshenv

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
