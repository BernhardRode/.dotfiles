if [ -e ".gitconfig.home" ]; then
  if [ $BCN ]; then
    cp ~/.gitconfig.bosch ~/.gitconfig  
  else
    cp ~/.gitconfig.home ~/.gitconfig  
  fi
fi
