[ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
[ ! -f  ~/.zsh/work.zsh ] || source ~/.zsh/work.zsh

# plugins
[ ! -f ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] || source ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ ! -f ~/.dotfiles/zsh/plugins/zsh-autosuggestionszsh-autosuggestions-master/zsh-autosuggestions.zsh ] || source ~/.dotfiles/zsh/plugins/zsh-autosuggestionszsh-autosuggestions-master/zsh-autosuggestions.zsh

# hot reload aliases
precmd() {
    [ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
}

eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"