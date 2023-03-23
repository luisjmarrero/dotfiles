#!/bin/bash

echo "--> configuring tools"

# configure zsh
ln -sf ~/.dotfiles/zsh/rc.zsh ~/.zshrc
mkdir -p ~/.zsh
ln -sf ~/.dotfiles/zsh/alias.zsh ~/.zsh/alias.zsh
ln -sf ~/.dotfiles/zsh/exports.zsh ~/.zsh/exports.zsh

mkdir -p ~/.config
mkdir -p ~/.config/alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.ym

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# nvim
mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua