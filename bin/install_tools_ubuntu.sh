#!/bin/bash

echo "--> installing tools"
# install homebrew packages
# sh bin/install_brew_packages.sh

# install zsh pluginss
sh bin/install_zsh_plugins.sh

# install sdkman
sh bin/install_sdkman.sh

# install starship
sh bin/install_starship.sh