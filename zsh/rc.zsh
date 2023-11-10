# better zsh history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

[ ! -f  ~/.zsh/keybindings.zsh ] || source ~/.zsh/keybindings.zsh
[ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
[ ! -f  ~/.zsh/exports.zsh ] || source ~/.zsh/exports.zsh
[ ! -f  ~/.zsh/work.zsh ] || source ~/.zsh/work.zsh

# plugins
[ ! -f ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] || source ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ ! -f ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] || source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# hot reload aliases
precmd() {
    [ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
}

export STARSHIP_CONFIG=~/.dotfiles/starship/starship.toml

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_win_title)

eval "$(starship init zsh)"

if uname -r |grep -q 'WSL2' ; then
    # Set PATH, MANPATH, etc., for Homebrew.
    [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ] || eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# fzf ctrl-r and alt-c behavior
# export FZF_DEFAULT_COMMAND="fd --hidden"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# export FZF_TMUX_OPTS='-p80%,60%'

# # Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

# # Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# # Use fd (https://github.com/sharkdp/fd) instead of the default find
# # command for listing path candidates.
# # - The first argument to the function ($1) is the base path to start traversal
# # - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }

# # Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }

# # Advanced customization of fzf options via _fzf_comprun function
# # - The first argument to the function is the name of the command.
# # - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift

#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }

# if [[ ! -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
#   sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -o /usr/share/doc/fzf/examples/completion.zsh
#   sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -o /usr/share/doc/fzf/examples/key-bindings.zsh
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.nvm/nvm.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
