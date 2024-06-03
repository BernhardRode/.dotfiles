# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'
alias cl='clear'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# ls aliases
alias ll='ls -lisah'
alias la='ls -A'
alias l='ls'

# EZA
if command -v eza &>/dev/null; then
  alias l="eza -l --icons --git -a"
  alias ll="l"
  alias lt="eza --tree --level=2 --long --icons --git"
fi

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Nvim
if command -v nvim &>/dev/null; then
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
fi

# Git
alias gs="git status"
alias wip='git add --all && git commit -S -m "wip: minor bugfixes and improvements"'
alias gp='git push'
alias wpp='wip && gp'

# Terraform
if command -v terraform &>/dev/null; then
  alias tf="terraform"
fi

# Kubernetes
if command -v kubectl &>/dev/null; then
  alias k="kubectl"
  alias kcns='kubectl config set-context --current --namespace'
fi

# Other
alias ncu="npx --yes npm-check -u"
