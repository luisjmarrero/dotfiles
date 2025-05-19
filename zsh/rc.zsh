# better zsh history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
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

# plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ ! -f ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] || source ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ ! -f ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] || source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# hot reload aliases
precmd() {
    [ ! -f  ~/.zsh/alias.zsh ] || source ~/.zsh/alias.zsh
}

# starship config
export STARSHIP_CONFIG=~/.dotfiles/starship/starship.toml
eval "$(starship init zsh)"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# assuming that rbenv was installed to `~/.rbenv`
FPATH=~/.rbenv/completions:"$FPATH"

# Added by `rbenv init` on Tue May  6 10:29:05 AST 2025
eval "$(rbenv init - --no-rehash zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ ! -f  ~/.globo_profile ] || source ~/.globo_profile