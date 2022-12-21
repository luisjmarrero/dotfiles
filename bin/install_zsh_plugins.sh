#!/bin/bash

rm -rf ~/.dotfiles/zsh/plugins/fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.dotfiles/zsh/plugins/fast-syntax-highlighting
rm -rf ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/.git

rm -rf ~/.dotfiles/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/zsh/plugins/zsh-autosuggestions
rm -rf ~/.dotfiles/zsh/plugins/zsh-autosuggestions/.git