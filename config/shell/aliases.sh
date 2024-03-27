# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lisah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Git
alias gs="git status"
alias wip='git add --all && git commit -m "wip: minor bugfixes and improvements"'

# Terraform
alias tf="terraform"

# Kubernetes
alias k="kubectl"

# Other
alias ncu="npx --yes npm-check -u"
