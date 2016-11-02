location=$(networksetup -getcurrentlocation)
if [ -e ".npmrc.home" ]
then
  cp ~/.npmrc.home ~/.npmrc  
  if [[ "$location" = "BCN" ]]; then
    cp ~/.npmrc.bosch ~/.npmrc  
  fi
fi
