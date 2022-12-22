#!/bin/bash

sh bin/backup_files.sh
sh bin/configure_tools_macos.sh
sh bin/install_tools_macos.sh

exec zsh