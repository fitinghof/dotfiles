# Detect OS
if [ -f /etc/arch-release ]; then
    OS="arch"
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    OS="ubuntu"
else
    echo "Unsupported OS. Please install git manually."
    exit 1
fi

# 1. Install zsh if not installed
if ! command -v git > /dev/null 2>&1; then
    echo "Installing git..."
    if [ "$OS" == "arch" ]; then
        sudo pacman -S --noconfirm git
    elif [ "$OS" == "ubuntu" ]; then
        sudo apt update
        sudo apt install -y git
    fi
else
    echo "git is already installed."
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

echo "Adding gitconfig"
sudo cp "$SCRIPT_DIR/.gitconfig" "$HOME/.gitconfig"
echo "Adding gitconfig finished"
