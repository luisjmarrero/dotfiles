#!/bin/bash

function install_homebrew {
  if ! command -v brew > /dev/null; then
    [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    RED='\033[0;31m'; NC='\033[0m' # No Color
    printf "${RED}%s${NC}\n" "Homebrew already installed"
  fi
}

install_homebrew