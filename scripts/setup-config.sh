#!/bin/bash
set -e

REPO_DIR="$HOME/macos-config-work"
CONFIG_DIR="$HOME/.config"

echo "Starting work macOS configuration setup..."

# Create necessary directories
echo "Creating config directories..."
mkdir -p "$CONFIG_DIR"/{starship,kitty,fastfetch,nvim}

# Create symlinks for config files
echo "Creating symlinks..."
ln -sfn "$REPO_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"
ln -sfn "$REPO_DIR/aerospace/default-config.toml" "$HOME/.aerospace.toml"
ln -sfn "$REPO_DIR/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"
ln -sfn "$REPO_DIR/kitty/current-theme.conf" "$CONFIG_DIR/kitty/current-theme.conf"
ln -sfn "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sfn "$REPO_DIR/zsh/.zprofile" "$HOME/.zprofile"
ln -sfn "$REPO_DIR/fastfetch/config.jsonc" "$CONFIG_DIR/fastfetch/config.jsonc"
ln -sfn "$REPO_DIR/nvim/init.lua" "$CONFIG_DIR/nvim/init.lua"
ln -sfn "$REPO_DIR/nightTab/nightTab-config.json" "$CONFIG_DIR/nightTab-config.json"

# Install Homebrew packages
echo "Installing Homebrew packages..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file="$REPO_DIR/homebrew/Brewfile"

echo "Configuration setup complete!"
echo "Installed and symlinked:"
echo "   • Starship shell prompt"
echo "   • Aerospace window manager config"
echo "   • Kitty terminal config"
echo "   • Zsh shell config (.zshrc, .zprofile)"
echo "   • Fastfetch system info config"
echo "   • Neovim config"
echo "   • NightTab config"
echo "   • All Homebrew packages from Brewfile"
echo ""