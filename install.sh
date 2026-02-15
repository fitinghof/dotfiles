echo "Running installation scripts for dotfiles"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running git install script"
PATH="$SCRIPT_DIR/git/install.sh"
chmod +x $PATH
"./$PATH"
echo "Git install script finished"

echo "Running zsh install script"
PATH="$SCRIPT_DIR/zsh/install.sh"
chmod +x "$SCRIPT_DIR/zsh/install.sh"
"./$PATH"
echo "Zsh install script finished"