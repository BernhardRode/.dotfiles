alias ll='ls -lisa'

if [ -d '/developer' ];
then
  alias d='cd /developer/src'
else
  alias d='cd ~/Development'
fi


# you would want to `source` this file, maybe in your .bash_profile?
function gap_fn(){
    git add .
    git commit -m "$@"
    git push
}

alias runjar=runjar_fn;

alias h='cd ~'
alias ..='cd ..'
alias compose='docker-compose'
alias reload='source ~/.bash_profile'
alias npub='npm publish --registry http://npm.apps.bosch-iot-cloud.com'

alias gup='git pull upstream master'
alias wip="git add . && git commit -m 'wip' && take-picture"
alias gpf="git push --force"
alias gr="git rebase -i origin/master"
alias gap=gap_fn
alias cg='curl -s google.com'
alias git-remove-merged='git branch --merged | grep -v \* | xargs git branch -D'

alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-remove-unused='docker rm $(docker ps -q -f status=exited)'

alias ys="npm start"
alias yt="npm run test"
alias ytdd="npm run tdd"
alias yl="npm run lint"
alias yd="npm run docs"
alias yb="npm run build"

alias yui="yarn upgrade-interactive"
alias ry="rm -Rf node_modules && rm -Rf package-lock.json && rm -f yarn.lock && npm install"

alias brew-update-all='brew update && brew upgrade $(brew outdated)'

alias git-clean="git clean -d -x -f -e node_modules && git checkout ."

alias vc="code ."
alias co="code ."

