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
alias wip="git add . && git commit --no-verify -m 'wip'"
alias gfeat="git add . && git commit -m 'feat: ${@}'"
alias gfix="git add . && git commit -m 'fix: ${@}'"
alias gchore="git add . && git commit -m 'chore: ${@}'"

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

# Others
alias ncu="npm-check -u"