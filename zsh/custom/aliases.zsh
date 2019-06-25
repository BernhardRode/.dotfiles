alias ll='ls -lisa'

if [ -d '/developer/src' ]; 
then
  alias d='cd /developer/src'
else
  alias d='cd ~/Development'
fi

alias h='cd ~'
alias ..='cd ..'

alias wip="git add . && git commit -m 'wip'"
alias gpush="git push"
alias gpull="git pull --rebase"
alias gr="git rebase -i origin/master"
alias cg='curl -s google.com'
alias git-remove-merged='git branch --merged | grep -v \* | xargs git branch -D'
alias git-remove-branches='git branch | grep -v "master" | xargs git branch -D'
alias git-remove-all-branches='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && git branch | grep -v "master" | xargs git branch -D" \;'
alias ys="npm start"
alias ry="rm -Rf node_modules && rm -Rf package-lock.json && rm -f yarn.lock && npm install"

alias npm-install-globals='npm install -g npm-check nodemon commitizen @angular/cli prettier' 
alias brew-update-all='brew update && brew upgrade $(brew outdated) && npm-install-globals'

alias git-clean="git clean -d -x -f -e node_modules && git checkout ."

alias vc="code ."
alias ncu="npm-check -u"
alias tf="terraform"
alias k="kubectl"
alias npmauth="npm login --auth-type=oauth"

