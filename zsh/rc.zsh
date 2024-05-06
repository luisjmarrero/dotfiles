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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.nvm/nvm.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-04-18 16:37:30
export PATH="$PATH:/home/lmarrero/.local/bin"
