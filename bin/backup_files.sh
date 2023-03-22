#!/bin/bash

# backup what is about to be changed
echo "--> backing up existing config"

currentdate=$(date +%Y%m%d-%H%M)
mkdir -p ~/.dotfiles-backups

# zsh
[ ! -f ~/.zshrc ] || cp ~/.zshrc  ~/.dotfiles-backups/.zshrc.bk.${currentdate}
mkdir -p ~/.dotfiles-backups/.zsh
[ ! -f  ~/.zsh/alias.zsh ] || cp ~/.zsh/alias.zsh ~/.dotfiles-backups/.zsh/alias.zsh.bk.${currentdate}

# starship
mkdir -p ~/.dotfiles-backups/.config
[ ! -f ~/.config/starship.toml ] || cp ~/.config/starship.toml ~/.dotfiles-backups/.config/starship.tomll.bk.${currentdate} 

# amethyst
[ ! -f ~/.amethyst.yml ] || cp ~/.amethyst.yml  ~/.dotfiles-backups/.amethyst.yml.bk.${currentdate}

# tmux
[ ! -f ~/.tmux.conf ] || cp ~/.tmux.conf  ~/.dotfiles-backups/.tmux.config.bk.${currentdate}

# alacritty
mkdir -p ~/.dotfiles-backups/.config/alacritty
[ ! -f ~/.config/alacritty/alacritty.yml ] || cp ~/.config/alacritty/alacritty.yml  ~/.dotfiles-backups/.config/alacritty/alacritty.yml.bk.${currentdate}