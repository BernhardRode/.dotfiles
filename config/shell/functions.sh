path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

# function lazy_nvm {
#   unset -f nvm
#   unset -f npm
#   unset -f node
#   unset -f npx
#
#   export NVM_DIR=~/.nvm
#   [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
# }
#
# # aliases
# function nvm { lazy_nvm; nvm "$@"; }
# function npm { lazy_nvm; npm "$@"; }
# function node { lazy_nvm; node "$@"; }
# function npx { lazy_nvm; npx "$@"; }

# Function for Git commits with a prefix
git_commit_with_prefix() {
  local prefix="$1"
  local message="$2"

  git add --all
  git commit -m "$prefix: $message"
}

# Function for `gfeat`
gfeat() {
  git_commit_with_prefix "feat" "$*"
}

# Function for `gchore`
gchore() {
  git_commit_with_prefix "chore" "$*"
}

# Function for `gfix`
gfix() {
  git_commit_with_prefix "fix" "$*"
}

ksns() {
    kubectl config set-context --current --namespace=$1
}

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git stash && git pull --ff-only && ./install -q && git stash pop
    )
}

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do
    /usr/bin/time $shell -i -c exit
  done
}

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    nvm use default
  fi
}

if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  nvm_cmds=(nvm node npm yarn)
  for cmd in $nvm_cmds ; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_DIR/nvm.sh --no-use && load-nvmrc && $cmd"
  done
fi
