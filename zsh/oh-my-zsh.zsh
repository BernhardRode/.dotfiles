# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud"
# ZSH_THEME="edvardm"

# zsh-nvm and zsh-autosuggestions must be installed separately
# plugins=(git direnv zsh-nvm dogesay)
plugins=(git direnv zsh-nvm)

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi
