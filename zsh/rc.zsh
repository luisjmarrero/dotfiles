export ZDOTDIR="~/.zsh"

# zsh history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file

autoload -U compinit; compinit # Zsh Completion System

# load custom files
[ ! -f  ~/.zsh/keybindings.zsh ] || source ~/.zsh/keybindings.zsh
[ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
[ ! -f  ~/.zsh/exports.zsh ] || source ~/.zsh/exports.zsh
[ ! -f  ~/.zsh/work.zsh ] || source ~/.zsh/work.zsh # this might or might not exist

# plugins
[ ! -f ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] || source ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ ! -f ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] || source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
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

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/bin:$PATH"

export PATH=/usr/local/bin:$PATH

# assuming that rbenv was installed to `~/.rbenv`
FPATH=~/.rbenv/completions:"$FPATH"

# Added by `rbenv init` on Tue May  6 10:29:05 AST 2025
eval "$(rbenv init - --no-rehash zsh)"

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)




