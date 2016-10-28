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
alias nvmup='nvm install 6 && npm install typescript typings tslint yarn gulp jspm angular-cli nodemon' 