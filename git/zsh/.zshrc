export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

autoload -Uz compinit
compinit
# Make Tab cycle through matches one by one, no menu displayed
bindkey '^I' menu-complete

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then   
  precmd() {
    PROMPT="%B%F{cyan}%n%f%F{cyan}@%f%F{cyan}%m%f %F{cyan}% ${PROMPT}%b"
  }
fi

