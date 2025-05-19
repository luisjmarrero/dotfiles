#!/bin/zsh

brew install git

brew install font-meslo-lg-nerd-font

brew install zsh-autosuggestions

brew install zsh-syntax-highlighting

brew install eza

brew install zoxide

brew install nvm

brew install jq

rm -rf ~/.dotfiles/zsh/plugins/fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.dotfiles/zsh/plugins/fast-syntax-highlighting
rm -rf ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/.git