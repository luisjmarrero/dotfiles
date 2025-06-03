alias reload-zsh="source ~/.zshrc"

# eza
if [ -x "$(command -v eza)" ]; then
    alias ls="eza --icons"
    alias lsa="eza --icons --all"
    alias la="eza --long --all --group --icons"
    alias l='eza -lah --icons'
    alias lt='eza --tree --icons --all'
fi

# ---- Zoxide (better cd) ----
alias cd="z"

# git aliases

alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gf='git fetch --all --prune'
alias gpl='git pull'

glog () {
    git log --all --graph --decorate -n 20 --oneline --pretty='%C(#f38ba8)%h%Creset -%C(#f2cdcd)%d%Creset %s %C(#a6e3a1)(%cr) %C(#89b4fa)<%an <%ae>>%Creset' --date-order
}

alias gsync='gf && gpl'
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gglog='gf && glog'

function gcp() {
  git commit -m "$*" && git push
}

# clear branches
function gbclear() {
  git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d
}

# docker aliases
function dcu() {
  docker compose up -d --build --remove-orphans
}

function dcuf() {
  docker compose up -d --build --remove-orphans --force-recreate
}

function dcd() {
  docker compose down --remove-orphans
}

function dsh() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') sh
}

function dbash() {
  #do things with parameters like $1 such as
  echo "running sh into $(docker ps | grep "$1" | awk '{print $1 " " $2}')"
  docker exec -it $(docker ps | grep "$1" | awk '{print $1}') bash
}

# maven
function pmvn() {
  rm -rf ~/.m2/repository
}

# node aliases
function pnode() {
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

# directories

function take() {
  mkdir -p "$1"
  cd "$1"
}

if uname | grep -q 'Darwin' ; then
    alias rm=trash # brew install trash
fi


alias fhistory='history | fzf'

function curlp() {
  curl $@ | jq
}

alias vtop="vtop --theme brew"

if [ -x "$(command -v bat)" ]; then
    alias batcat="bat"
fi

alias grep="grep --color=always"

alias fzff="fzf --preview 'bat --style=numbers --color=always {}'"

function kill-app() {
  pid=$(ps aux | fzf | awk '{print $2}')
  echo "Killing PID: $pid"
  kill -9 "$pid"
}

alias h='fc -ln -$1'

# rails aliases

alias rc='rails console'
alias rcs='rails console --sandbox'

# Disable globbing for bundle exec
function bundle() {
  if [[ $1 == "exec" ]]; then
    noglob command bundle "$@"
  else
    command bundle "$@"
  fi
}

alias be="bundle exec"

alias cat='bat --paging=never'

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

alias work="timer 60m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break!'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work!'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

