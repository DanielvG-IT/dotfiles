#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing APT packages..."
xargs sudo apt install -y < apt-packages.txt

echo "Installing Snap packages..."
xargs -I {} sudo snap install {} < snap-packages.txt

echo "Installing Flatpak packages..."
xargs -I {} flatpak install -y flathub {} < flatpak-packages.txt

echo "Installing Homebrew packages..."
xargs brew install < brew-packages.txt

echo "Restoring dotfiles..."
cp -r dotfiles/. ~

echo "Done! Reboot your system."
