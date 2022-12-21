#!/bin/bash

# backup what is about to be changed
function backup {
    echo "--> backing up existing config"
    
    currentdate=$(date +%Y%m%d-%H%M)
    mkdir -p ~/.dotfiles-backups
    
    # zsh
    [ ! -f ~/.zshrc ] || cp ~/.zshrc  ~/.dotfiles-backups/.zshrc.bk.${currentdate}
    mkdir -p ~/.dotfiles-backups/.zsh
    [ ! -f  ~/.zsh/alias.zsh ] || cp ~/.zsh/alias.zsh ~/.dotfiles-backups/.zsh/alias.zsh.bk.${currentdate}
    [ ! -f  ~/.zsh/work.zsh ] || cp ~/.zsh/work.zsh ~/.dotfiles-backups/.zsh/work.zsh.bk.${currentdate}

    # starship
    mkdir -p ~/.dotfiles-backups/.config
    [ ! -f ~/.config/starship.toml ] || cp ~/.config/starship.toml ~/.dotfiles-backups/.config/starship.tomll.bk.${currentdate} 

    # amethyst
    [ ! -f ~/.amethyst.yml ] || cp ~/.amethyst.yml  ~/.dotfiles-backups/.amethyst.yml.bk.${currentdate}
}

function install {
    echo "--> installing tools"
    # install homebrew
    sh bin/install_brew.sh

    # install homebrew packages
    sh bin/install_brew_packages.sh

    # install zsh pluginss
    sh bin/install_zsh_plugins.sh

    # install sdkman
    sh bin/install_sdkman.sh

    # install starship
    sh bin/install_starship.sh

    # install amethyst
    sh bin/install_amethyst.sh
}

function configure {
    echo "--> configuring tools"
    
    # configure zsh
    ln -sf ~/.dotfiles/zsh/rc.zsh ~/.zshrc
    mkdir -p ~/.zsh
    ln -sf ~/.dotfiles/zsh/alias.zsh ~/.zsh/alias.zsh
    ln -sf ~/.dotfiles/zsh/work.zsh ~/.zsh/work.zsh

    # configure starship
    mkdir -p ~/.config
    ln -sf ~/.dotfiles/startship/starship.toml ~/.config/starship.toml

    # configure amethyst
    ln -sf ~/.dotfiles/amethyst/amethyst.yml ~/.amethyst.yml
}

backup
install
configure

exec zsh