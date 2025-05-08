#!/bin/bash

echo "--> installing tools"
# install homebrew
sh bin/install_brew.sh

# install homebrew packages
sh bin/install_brew_packages.sh

# install zsh pluginss
sh bin/install_zsh_plugins.sh

# install starship
sh bin/install_starship.sh
