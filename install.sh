echo "Running installation scripts for dotfiles"

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

echo "Running git install script"
INSTALL_PATH="$SCRIPT_DIR/git/install.sh"
chmod +x "$INSTALL_PATH"
"$INSTALL_PATH"
echo "Git install script finished"

echo "Running zsh install script"
INSTALL_PATH="$SCRIPT_DIR/zsh/install.sh"
chmod +x "$INSTALL_PATH"
"$INSTALL_PATH"
echo "Zsh install script finished"
