# One line install command:
# curl -fsSL https://raw.githubusercontent.com/fitinghof/dotfiles/blob/main/install.sh | bash

echo "Running installation scripts for dotfiles"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect OS
if [[ -f /etc/arch-release ]]; then
    OS="arch"
elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
    OS="ubuntu"
else
    echo "Unsupported OS. Please install zsh manually."
    exit 1
fi

# Start by installing git
if ! command -v git > /dev/null 2>&1; then
    echo "Installing git..."
    if [[ "$OS" == "arch" ]]; then
        sudo pacman -S --noconfirm git
    elif [[ "$OS" == "ubuntu" ]]; then
        sudo apt update
        sudo apt install -y git
    fi
else
    echo "git is already installed, skipping"
fi

git pull https://github.com/fitinghof/dotfiles

echo "Running git install script"
PATH="$SCRIPT_DIR/git/install.sh"
chmod +x $PATH
"$PATH"
echo "Git install script finished"

echo "Running zsh install script"
PATH="$SCRIPT_DIR/zsh/install.sh"
chmod +x "$SCRIPT_DIR/zsh/install.sh"
"$PATH"
echo "Zsh install script finished"