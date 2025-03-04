# PowerShell Script to Install Developer Tools on Windows

# Ensure script runs as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    exit
}

# Enable Winget if not installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is required. Please install it manually from the Microsoft Store." -ForegroundColor Red
    exit
}

# Update System Packages
Write-Host "Updating Windows..." -ForegroundColor Cyan
winget upgrade --all

# Install Core Development Tools
Write-Host "Installing Core Development Tools..." -ForegroundColor Cyan
winget install -e --id Git.Git
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.VisualStudio.2022.Community
winget install -e --id Microsoft.DotNet.SDK.8
winget install -e --id Node.js.LTS
winget install -e --id PHP.PHP
winget install -e --id Python.Python.3
winget install -e --id PostgreSQL.PostgreSQL
winget install -e --id Docker.DockerDesktop

# Install Shell and Terminal Tools
Write-Host "Installing Zsh, Oh My Posh, and Windows Terminal..." -ForegroundColor Cyan
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id JanDeDobbeleer.OhMyPosh

# Install Neovim and FZF
Write-Host "Installing Neovim and FZF..." -ForegroundColor Cyan
winget install -e --id Neovim.Neovim
winget install -e --id junegunn.fzf

# Install Nginx
Write-Host "Installing Nginx..." -ForegroundColor Cyan
winget install -e --id Nginx.Nginx

# Install Unity Hub
Write-Host "Installing Unity Hub..." -ForegroundColor Cyan
winget install -e --id Unity.UnityHub

# Install Microsoft 365 Apps
Write-Host "Installing Microsoft 365 Apps..." -ForegroundColor Cyan
winget install -e --id Microsoft.Office

Write-Host "All tools installed successfully! Restart your system for all changes to take effect." -ForegroundColor Green
