#!/bin/bash
set -e

# Detect OS
if [[ -f /etc/arch-release ]]; then
    OS="arch"
elif [[ -f /etc/lsb-release ]] || [[ -f /etc/debian_version ]]; then
    OS="ubuntu"
else
    echo "Unsupported OS. Please install zsh manually."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Install zsh if not installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "Installing zsh..."
    if [[ "$OS" == "arch" ]]; then
        sudo pacman -S --noconfirm zsh
    elif [[ "$OS" == "ubuntu" ]]; then
        sudo apt update
        sudo apt install -y zsh
    fi
else
    echo "zsh is already installed."
fi

# 2. Install Oh My Zsh if not installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# 3. Copy ./file contents into ~/.zshrc
if [[ -f "$SCRIPT_DIR/.zshrc" ]]; then
    echo "Copying $SCRIPT_DIR/.zshrc contents into ~/.zshrc..."
    cp $SCRIPT_DIR/.zshrc ~/.zshrc
else
    echo "./.zshrc not found. Skipping .zshrc copy."
fi

if command -v git >/dev/null 2>&1; then
    echo "Installing zsh dependencies..."

    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # zsh-autosuggestions
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    else
        echo "zsh-autosuggestions already installed."
    fi

    # zsh-syntax-highlighting
    if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    else
        echo "zsh-syntax-highlighting already installed."
    fi

    # # zsh-autocomplete
    # if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]]; then
    #     git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
    # else
    #     echo "zsh-autocomplete already installed."
    # fi

else
    echo "Git not found, cannot install zsh dependencies."
fi

# Set new default shell
chsh -s $(which zsh)

# swap into new shell instantly
zsh

# Make sure config is loaded
source ~/.zshrc

echo "zsh installation complete"
