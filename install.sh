echo "Running installation scripts for dotfiles"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running zsh install script"
chmod +x "$SCRIPT_DIR/git/zsh/install.sh"
./git/zsh/install.sh
echo "Zsh install script finished"