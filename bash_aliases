alias ll='ls -lisa'

if [ -d '/developer' ]; 
then
  alias d='cd /developer/src'
else
  alias d='cd ~/Development'
fi
alias h='cd ~'
alias ..='cd ..'
alias compose='docker-compose'
alias reload='source ~/.bash_profile'
alias npub='npm publish --registry http://npm.apps.bosch-iot-cloud.com'
