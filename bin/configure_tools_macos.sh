#!/bin/bash

echo "--> configuring tools"

# configure zsh
ln -sf ~/.dotfiles/zsh/rc.zsh ~/.zshrc
mkdir -p ~/.zsh
ln -sf ~/.dotfiles/zsh/alias.zsh ~/.zsh/alias.zsh

# configure amethyst
ln -sf ~/.dotfiles/amethyst/amethyst.yml ~/.amethyst.yml
