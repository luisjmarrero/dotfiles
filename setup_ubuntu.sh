#!/bin/bash

sh bin/backup_files.sh
sh bin/install_tools_ubuntu.sh
sh bin/configure_tools_ubuntu.sh

exec zsh