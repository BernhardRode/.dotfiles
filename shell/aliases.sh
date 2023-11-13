# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Git
alias gst="git status"
alias wip='git add --all && git commit --no-verify -m "wip"'

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

# Terraform
alias tf="terraform"

# Kubernetes
alias k="kubectl"
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kdp='kubectl describe pod'
alias kdc='kubectl describe svc'

ksns() {
    kubectl config set-context --current --namespace=$1
}

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Other
alias ncu="npx --yes npm-check -u"
