#!/bin/bash

# Set up global constants 
readonly DOTFILES_DIR="$HOME/dev/dotfiles"
readonly SYMLINK_TARGET_DIR="$HOME"
readonly STOW_CMD="stow -R -v -d $DOTFILES_DIR -t $SYMLINK_TARGET_DIR"

echo "🚀 Starting Dotfiles Setup..."

# 1. Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Run Brew Bundle (Installs everything in Brewfile)
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "📦 Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "❌ Brewfile not found at $DOTFILES_DIR/Brewfile"
    exit 1
fi

# 3. Node Setup (fnm)
echo "🟢 Installing Node LTS..."

# We use --shell bash here because this script IS bash.
# This only affects the temporary setup process, not your actual .zshrc.
eval "$(fnm env --use-on-cd --shell bash)"

fnm install --lts

# 4. Apply macOS defaults
# Make sure the script is executable
chmod +x ./scripts/macos-defaults.sh
./scripts/macos-defaults.sh

# 5. Symlink dotfiles 
echo "🔗 Creating dotfiles symlinks..."

# -R (Restow): "Refresh links and delete dead ones."
# -v (Verbose): "Tell me what you are doing."
# -d ~/dev/dotfiles (Source): "The real files live here."
# -t ~ (Target): "Put the symlinks starting with this folder. Needed if not parent of dotfiles."


echo "🔗 Linking dotfiles..."
$STOW_CMD stow
$STOW_CMD nvim ghostty git zsh bat lazygit

echo "✅ Setup Complete! Restart your terminal to see changes."

