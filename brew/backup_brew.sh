#!/bin/zsh

# generate brewfile
brew bundle dump --force --file ~/.dotfiles/brew/Brewfile

# backup original Brewfile
cp Brewfile Brewfile.bk

# sort Brewfile
(rg '^tap' Brewfile | sort) > Brewfile.sorted && \
(rg '^brew' Brewfile | sort) >> Brewfile.sorted && \
(rg '^cask' Brewfile | sort) >> Brewfile.sorted && \
mv Brewfile.sorted Brewfile