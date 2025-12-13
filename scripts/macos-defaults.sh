#!/bin/bash


# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

echo "🔧 Setting sensible macOS defaults..."

# ==============================================
# KEYBOARD (Critical for Neovim)
# ==============================================

# Disable "press and hold" for accents so keys repeat
# (Essential for holding h/j/k/l in Vim)
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ==============================================
# FINDER
# ==============================================

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show filename extensions (e.g. .txt, .js)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar (bottom of window)
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar (bottom of window)
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search the current folder by default (not "This Mac")
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ==============================================
# DOCK & UI
# ==============================================

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding delay (makes Dock feel faster)
defaults write com.apple.dock autohide-delay -float 0

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# ==============================================
# SCREENSHOTS
# ==============================================

# Save screenshots to a dedicated folder (instead of messy Desktop)
# mkdir -p "${HOME}/Screenshots"
# defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# ==============================================
# TEXT EDITING / MISC
# ==============================================

# Disable smart quotes and dashes (annoying for coding)
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ==============================================
# APPLY CHANGES
# ==============================================

echo "♻️  Restarting Finder and Dock to apply changes..."
killall Finder
killall Dock

echo "✅ Done. Note: You may need to restart your Mac for all changes to take effect."
