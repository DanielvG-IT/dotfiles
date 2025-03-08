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

@echo off

:: Update winget
echo "Updating winget..."
winget upgrade --all -y &>nul

:: Install core development tools
echo "Installing core development tools..."
winget install --id=Microsoft.CppBuildTools -y
winget install --id=Git.Git -y
winget install --id=Microsoft.AzureDataStudio -y
winget install --id=Microsoft.VisualStudioCode -y
winget install --id=NodeJS.NodeJS -y
winget install --id=Microsoft.DotNet.SDK.8 -y

:: Install Visual Studio Code
echo "Installing Visual Studio Code..."
winget install --id=Microsoft.VisualStudioCode -y

:: Install Google Chrome
echo "Installing Google Chrome..."
winget install --id=Google.Chrome -y

:: Install Azure Data Studio
echo "Installing Azure Data Studio..."
winget install --id=Microsoft.AzureDataStudio -y

:: Install DBeaver
echo "Installing DBeaver..."
winget install --id=DBeaver.DBeaver -y

:: Install Postman
echo "Installing Postman..."
winget install --id=Postman.Postman -y

:: Install Bitwarden
echo "Installing Bitwarden..."
winget install --id=Bitwarden.Bitwarden -y

:: Install GitHub CLI
echo "Installing GitHub CLI..."
winget install --id=GitHub.cli -y

:: Install WireGuard VPN
echo "Installing WireGuard VPN..."
winget install --id=WireGuard.WireGuard -y

:: Install Spotify
echo "Installing Spotify..."
winget install --id=Spotify.Spotify -y

:: Install Discord
echo "Installing Discord..."
winget install --id=Discord.Discord -y

:: Install Unity Hub
Write-Host "Installing Unity Hub..." -ForegroundColor Cyan
winget install -e --id Unity.UnityHub

:: Install Microsoft 365 Apps
Write-Host "Installing Microsoft 365 Apps..." -ForegroundColor Cyan
winget install -e --id Microsoft.Office

:: Install Windows Terminal
echo "Installing Windows Terminal..."
winget install --id=Microsoft.WindowsTerminal -y

:: Install Oh My Posh (PowerShell Prompt Customization)
echo "Installing Oh My Posh..."
winget install --id=JanDeDobbeleer.OhMyPosh -y

:: Install Powerline Font (Nerd Font)
echo "Installing Nerd Font..."
winget install --id=Microsoft.PowerToys -y
winget install --id=nerdfonts -y

:: Set up Windows Terminal to use a custom profile with Oh My Posh
echo "Configuring Windows Terminal..."
# Make sure Windows Terminal is installed and ready, then we will modify the settings manually.
# Open the terminal and run this command to apply Oh My Posh in your profile:

echo "After installation, open Windows Terminal, and apply the following settings manually:"
echo "1. Open Settings (Ctrl + ,)"
echo "2. In the 'Startup' tab, ensure 'Windows PowerShell' is selected as your default profile."
echo "3. Under 'Appearance', set a font such as 'Cascadia Code PL' or 'FiraCode Nerd Font'."
echo "4. In the 'Command line' section, add the following to the profile's command line (replace 'powershell' with 'pwsh' if using PowerShell Core):"
echo "`$env:POSH_INIT_PATH = 'C:\Program Files\JanDeDobbeleer\OhMyPosh\posh.psm1'; Import-Module \$env:POSH_INIT_PATH; Set-PoshPrompt -Theme <your favorite theme>`"
echo "5. Save the settings."

Write-Host "All tools installed successfully! Restart your system for all changes to take effect." -ForegroundColor Green
