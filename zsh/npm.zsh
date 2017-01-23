if [ -e ".npmrc.home" ]; then
  if [ $BCN ]; then
    cp ~/.npmrc.bosch ~/.npmrc  
  else
    cp ~/.npmrc.home ~/.npmrc  
  fi
fi
