DIRECTORY="/snap/bin"
if [ -d "$DIRECTORY" ]; then
  export PATH=$PATH:$DIRECTORY
fi

DIRECTORY="~/.bun/bin"
if [ -d "$DIRECTORY" ]; then
  export PATH=$PATH:$DIRECTORY
fi

