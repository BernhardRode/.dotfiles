source $ZPLUG_HOME/init.zsh

# Add plugins here
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-autcomplete", defer:2
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "laggardkernel/zsh-tmux", use:init.zsh, from:github
zplug "ptavares/zsh-direnv"

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
  zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load

eval "$(tmuxifier init -)"
