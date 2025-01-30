# Requires PowerShell as Administrator
# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run as Administrator!"
    Break
}

# Install Chocolatey (Windows package manager)
Write-Output "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Git
Write-Output "Installing Git..."
choco install git -y

# Install NVM for Windows
Write-Output "Installing NVM for Windows..."
choco install nvm -y

# Refresh environment variables
refreshenv

# Install Node.js versions using NVM
Write-Output "Installing Node.js versions..."
nvm install lts
nvm install latest
nvm use lts

# Create a .nvmrc file in the Dev
Write-Output "Creating .nvmrc file..."
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Dev"
Set-Location -Path "$env:USERPROFILE\Dev"
nvm current > .nvmrc

# Install global npm packages
Write-Output "Installing Node.js development tools..."
npm install -g typescript ts-node
npm install -g snyk
npm install -g jest
npm install -g newman
npm install -g pm2

# Install Visual Studio Code
Write-Output "Installing Visual Studio Code..."
choco install vscode -y

# Install Docker Desktop
Write-Output "Installing Docker Desktop..."
choco install docker-desktop -y

# Install Windows Terminal
Write-Output "Installing Windows Terminal..."
choco install microsoft-windows-terminal -y

# Install WSL2
Write-Output "Installing WSL2..."
wsl --install

# Install Kubernetes CLI
Write-Output "Installing kubectl..."
choco install kubernetes-cli -y

# Install Helm
Write-Output "Installing Helm..."
choco install kubernetes-helm -y

# Install GitLab Runner
Write-Output "Installing GitLab Runner..."
choco install gitlab-runner -y

# Create directory structure
Write-Output "Creating directory structure..."
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Dev\projects"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Dev\scripts"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Dev\docker"

# Git configuration
Write-Output "Configuring Git..."
git config --global init.defaultBranch main

# Install VS Code extensions
Write-Output "Installing VS Code extensions..."
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.powershell
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

# Enable Hyper-V (required for Docker)
Write-Output "Enabling Hyper-V..."
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

Write-Output "Installation completed! Please restart your computer."

# Add NVM settings to PowerShell profile
$nvmPath = "$env:APPDATA\nvm"
$nodeModulesPath = "$env:APPDATA\npm-cache"

$profileContent = @"
# NVM Configuration
Set-Item -Path Env:NVM_HOME -Value "$nvmPath"
Set-Item -Path Env:NVM_SYMLINK -Value "$env:PROGRAMFILES\nodejs"
Set-Item -Path Env:NODE_PATH -Value "$nodeModulesPath"

# Add NVM to PATH
`$env:Path += ";$nvmPath;$env:PROGRAMFILES\nodejs"
"@

Add-Content $PROFILE $profileContent
