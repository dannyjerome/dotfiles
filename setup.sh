#!/bin/bash

# Function to install packages
install_packages() {
    echo "Installing packages..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # For Debian/Ubuntu-based distributions
        sudo apt update
        sudo apt install -y git stow curl zsh neovim tmux fzf
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # For macOS
        brew install git stow curl zsh neovim tmux fzf
    elif [[ "$OSTYPE" == "win32" ]]; then
        # For WSL on Windows
        echo "Please ensure WSL is installed and configured with a suitable package manager."
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

# Function to symlink dotfiles using GNU Stow
symlink_dotfiles() {
    echo "Symlinking dotfiles..."
    stow zsh
    stow nvim
    stow tmux
}

# Function to set up Zsh as the default shell
set_zsh_as_default() {
    echo "Setting Zsh as the default shell..."
    if [[ "$SHELL" != *"zsh"* ]]; then
        chsh -s $(which zsh)
        echo "Please log out and back in for the changes to take effect."
    else
        echo "Zsh is already your default shell."
    fi
}

# Function to install Starship
install_starship() {
    echo "Installing Starship..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        curl -sS https://starship.rs/install.sh | sh
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install starship
    fi
    
    # Add Starship initialization to Zsh configuration
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
}

# Function to install fzf and configure key bindings
install_fzf() {
    echo "Installing fzf..."
    if [ ! -d "$HOME/.fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    else
        echo "fzf is already installed."
    fi
}

# Run the installation functions
install_packages
symlink_dotfiles
set_zsh_as_default
install_starship
install_fzf

echo "Setup completed! Please restart your terminal session."

