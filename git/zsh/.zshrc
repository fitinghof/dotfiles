export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

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

