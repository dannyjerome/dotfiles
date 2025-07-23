# dotfiles

## Overview

This repository contains configuration files (dotfiles) for:
- **Zsh** (shell)
- **Bash** (shell)
- **Tmux** (terminal multiplexer)
- **Neovim** (text editor)
- **Starship** (prompt)
- **fzf** (fuzzy finder)
- And more!

The provided `setup.sh` script automates the installation and configuration of most required tools and packages for a smooth developer environment.

---

## Quick Start (Recommended)

1. **Clone this repository:**
   ```sh
   git clone https://github.com/your-username/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the setup script:**
   ```sh
   bash setup.sh
   ```
   This will:
   - Install: `git`, `stow`, `curl`, `zsh`, `neovim`, `tmux`, `fzf`
   - Symlink dotfiles using GNU Stow (including bash, zsh, tmux, nvim)
   - Set Zsh as your default shell
   - Install Starship prompt
   - Install fzf

3. **Restart your terminal** for all changes to take effect.

---

## Additional Manual Steps

Some tools require manual installation or activation:

- **Install TPM (Tmux Plugin Manager):**
  ```sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- **(Optional) Install Oh My Zsh:**
  ```sh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- **Install Tmux Plugins:**
  1. Start a tmux session: `tmux`
  2. Press your tmux prefix (`Ctrl+a` as set in this config), then `I` (capital i) to install plugins via TPM.

---

## Manual Setup (Alternative)
If you prefer, you can follow the steps in the setup script manually (see `setup.sh` for details), but running the script is recommended for most users.

---

**Enjoy your new environment!**
