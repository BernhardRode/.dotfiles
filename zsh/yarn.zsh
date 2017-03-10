if [ -e ".yarnrc.home" ]; then
  if [ $BCN ]; then
    cp ~/.yarnrc.bosch ~/.yarnrc  
  else
    cp ~/.yarnrc.home ~/.yarnrc  
  fi
fi

export PATH="$PATH:`yarn global bin`"