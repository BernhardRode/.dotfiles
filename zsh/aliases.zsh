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
alias gap=gap_fn
alias cg='curl -s google.com' 

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
alias yl="yarn run lint"
alias yd="yarn run tdd"
alias yb="yarn run build"

alias brew-update-all='brew update && brew install $(brew outdated)'

alias git-clean="git clean -d -x -f -e node_modules && git checkout ."
