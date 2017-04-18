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

alias mbb-docker-update='cd /developer/src/mbb-docker && git pull'
alias mbb-electron-update='cd /developer/src/mbb-electron && git pull' 
alias mbb-electron='mbb-docker-update && mbb-electron-update && cd /developer/src/mbb-electron && yarn run start'
alias rcs-app-serviceprovider='cd /developer/src/rcs-app-serviceprovider && yarn run start'
alias rcs-app-frontend='cd /developer/src/rcs-app-frontend && yarn run start'

alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-remove-unused='docker rm $(docker ps -q -f status=exited)'

alias ys="yarn start"
alias yt="yarn run test"
alias ytdd="yarn run tdd"
alias yl="yarn run lint"
alias yd="yarn run docs"
alias yb="yarn run build"

alias yui="yarn upgrade-interactive"
alias ry="rm -Rf node_modules && rm -f yarn.lock && yarn"

alias brew-update-all='brew update && brew install $(brew outdated)'

alias git-clean="git clean -d -x -f -e node_modules && git checkout ."

alias python="python3"
alias pip="pip3"

alias cc="code ."

alias carnd1="docker run -it --rm -p 8888:8888 -v `pwd`:/src udacity/carnd-term1-starter-kit"