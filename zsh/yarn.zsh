location=$(networksetup -getcurrentlocation)
if [ -e ".yarnrc.home" ]
then
  cp ~/.yarnrc.home ~/.yarnrc  
  if [[ "$location" = "BCN" ]]; then
    cp ~/.yarnrc.bosch ~/.yarnrc  
  fi
fi
