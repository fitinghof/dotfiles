export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then   
  precmd() {
    PROMPT="%F{green}%n%f%F{white}@%f%F{green}%m%f %F{cyan}%~%f "
  }
fi

