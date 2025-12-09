#!/bin/bash
# init-nvim.sh
# ----------------------------
# Initialize your Neovim configuration from your dotfiles repository.
#
# This script will:
# 1. Backup your existing Neovim config (~/.config/nvim)
# 2. Copy your nvim config from the dotfiles repo into ~/.config/nvim
# 3. Ensure vim-plug is installed
#
# Requirements:
# - Neovim >= 0.11
# - vim-plug (will be auto-installed if missing)
# - Node.js (for tsserver, eslint, tailwindcss LSP)
# - Optional: npm or pnpm (to install language servers if not already installed)
# - Java JDK + jdtls (for Java LSP)
# - ripgrep, fd, git, ctags (optional, used by some plugins)
#
# LSP servers you should have installed:
# - typescript-language-server (tsserver)
# - vscode-html-language-server (html)
# - vscode-css-language-server (cssls)
# - vscode-json-language-server (jsonls)
# - vscode-eslint-language-server (eslint)
# - tailwindcss-language-server (tailwindcss)
# - jdtls (Java)
#
# How to run:
# 1. Clone my dotfiles repo:
#    git clone https://github.com/kuwarte/dotfiles.git ~/dotfiles
# 2. Go to the repo:
#    cd ~/dotfiles
# 3. Make the script executable:
#    chmod +x init-nvim.sh
# 4. Run the script:
#    ./init-nvim.sh
#
# After running:
# - Open Neovim and run :PlugInstall
# - Ensure the LSP servers above are installed for proper autocomplete & diagnostics

set -e  # exit immediately if a command exits with a non-zero status
set -u  # exit if trying to use an undefined variable

# --- Detect the directory of this script (repo root) ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/nvim"

echo "Initializing Neovim config from $DOTFILES_DIR"

# --- Backup existing config ---
if [ -e "$HOME/.config/nvim" ]; then
    BACKUP="$HOME/.config/nvim.backup.$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing Neovim config:"
    echo "  ~/.config/nvim -> $BACKUP"
    mv "$HOME/.config/nvim" "$BACKUP"
fi

# --- Copy Neovim config ---
mkdir -p "$HOME/.config"
echo "Copying Neovim config..."
cp -r "$DOTFILES_DIR" "$HOME/.config/nvim"

# --- Ensure vim-plug is installed ---
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    echo "vim-plug not found. Installing..."
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo
echo "===================================================="
echo "   Optional: Install Neovim v0.11+ using tarball    "
echo "===================================================="
echo "1. Download tarball:"
echo "    wget https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.tar.gz"
echo "2. Extract:"
echo "    tar xzvf nvim-linux-x86_64.tar.gz"
echo "3. Move to /usr/local:"
echo "    sudo mv nvim-linux-x86_64 /usr/local/nvim"
echo "    sudo ln -sf /usr/local/nvim/bin/nvim /usr/bin/nvim"
echo "4. Check version:"
echo "    nvim --version"
echo "===================================================="
echo

echo "Neovim config initialization complete!"
echo "Open Neovim and run :PlugInstall to install all plugins."
echo "Make sure the following LSP servers are installed for autocomplete & diagnostics:"
echo " - typescript-language-server (tsserver)"
echo " - vscode-html-language-server (html)"
echo " - vscode-css-language-server (cssls)"
echo " - vscode-json-language-server (jsonls)"
echo " - vscode-eslint-language-server (eslint)"
echo " - tailwindcss-language-server (tailwindcss)"
echo " - jdtls (Java LSP) --installed when [ :PlugInstall ]"

