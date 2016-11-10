location=$(networksetup -getcurrentlocation)
if [ -e ".gitconfig.home" ]
then
  cp ~/.gitconfig.home ~/.gitconfig  
  if [[ "$location" = "BCN" ]]; then
    cp ~/.gitconfig.bosch ~/.gitconfig  
  fi
fi
