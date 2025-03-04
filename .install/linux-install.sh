#!/bin/bash
set -e  # Exit on error

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Install core development tools
sudo apt install -y build-essential curl wget git unzip software-properties-common htop sqlcmd azure-cli

# Install Zsh and set it as default shell
sudo apt install -y zsh
default_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$default_shell" != "/usr/bin/zsh" ]; then
    chsh -s $(which zsh)
fi

# Install Oh My Zsh for better Zsh experience
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Tmux
sudo apt install -y tmux

# Install Node.js and npm (latest LTS)
if ! command -v node &>/dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install PHP and Composer
sudo apt install -y php-cli php-mbstring unzip
if ! command -v composer &>/dev/null; then
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
fi

# Install .NET SDK (for C# development)
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update && sudo apt install -y dotnet-sdk-8.0

# Install Visual Studio Code
if ! command -v code &>/dev/null; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    sudo apt update && sudo apt install -y code
fi

# Install Unity Hub
if ! command -v unityhub &>/dev/null; then
    wget -O unityhub.AppImage https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage
    chmod +x unityhub.AppImage
    sudo mv unityhub.AppImage /usr/local/bin/unityhub
fi

# Install Neovim
sudo apt install -y neovim

# Install FZF (fuzzy finder)
sudo apt install -y fzf

# Install Nginx
sudo apt install -y nginx

# Install Docker & Docker Compose
if ! command -v docker &>/dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    rm get-docker.sh
fi

if ! command -v docker-compose &>/dev/null; then
    sudo apt install -y docker-compose
fi

# Final message
echo "Development environment setup complete! Please restart your system for changes to take effect."