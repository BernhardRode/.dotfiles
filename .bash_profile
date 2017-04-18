if [ -e ~/.bash_credentials ]
then
  source ~/.bash_credentials  
fi

export DOTFILES=~/Applications/dotfiles/bash_*
for file in $DOTFILES
do
 source $file
done
clear

export PATH="$HOME/.yarn/bin:$PATH"

# added by Miniconda3 4.3.11 installer
export PATH="/Users/ebbo/miniconda3/bin:$PATH"
