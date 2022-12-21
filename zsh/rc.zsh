# better zsh history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

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