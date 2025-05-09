# eza
if [ -x "$(command -v eza)" ]; then
    alias ls="eza --icons"
    alias lsa="eza --icons --all"
    alias la="eza --long --all --group --icons"
    alias l='eza -lah --icons'
    alias lt='eza --tree --icons --all'
fi

# git aliases
function gacpm() {
  git add . && git commit -m $1 && git push origin
}

function gacp() {
  git add . && git commit -m $1 && git push
}

function gcp() {
  git commit -m $1 && git push
}

function gchb() {
   git checkout -b $1
}

function glog() {
    git log --all --graph --decorate -n 25 --oneline --pretty=format:"%h - %cn %ah: %s [branch: %D]"
}

function gsync() {
    git fetch --all --prune && git pull
}

# clear branches
function gcb() {
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
funtion pmvn() {
  rm -rf ~/.m2/repository
}

# node aliases
function pnode() {
  find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
}

# directories

function take() {
  mkdir -p $1
  cd $1
}

if uname | grep -q 'Darwin' ; then
    alias rm=trash # brew install trash
fi


alias history='history -E'

funtion curlp() {
  curl $@ | jq
}

alias vtop="vtop --theme brew"

if [ -x "$(command -v bat)" ]; then
    alias batcat="bat"
fi

alias grep="grep --color=always"
