#!/bin/bash

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install basic development tools
echo "Installing development essentials..."
sudo apt install -y build-essential git curl wget

# Install NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js using NVM
echo "Installing Node.js via NVM..."
nvm install --lts
nvm install node # Latest version
nvm use --lts # Set LTS as default

# Create .nvmrc in workspace
echo "Creating .nvmrc with LTS version..."
mkdir -p ~/Dev
cd ~/Dev
node -v > .nvmrc

# Install global npm packages
echo "Installing Node.js global packages..."
npm install -g typescript ts-node
npm install -g snyk
npm install -g npm-audit-fix
npm install -g jest
npm install -g newman
npm install -g pm2

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install containerization tools
echo "Installing container tools..."
sudo apt install -y podman skopeo

# Install GitLab Runner
echo "Installing GitLab Runner..."
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt install gitlab-runner

# Install Kubernetes tools
echo "Installing Kubernetes tools..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install VS Code (if snap is available)
if command -v snap &> /dev/null; then
    echo "Installing VS Code..."
    sudo snap install code --classic
else
    echo "Installing VS Code via apt..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install code
    rm packages.microsoft.gpg
fi

# Create default workspace
echo "Creating workspace structure..."
mkdir -p ~/Dev/projects
mkdir -p ~/Dev/scripts
mkdir -p ~/Dev/docker

# Setup Git configuration
echo "Configuring Git..."
git config --global init.defaultBranch main

# Add NVM to shell profile if not already present
if ! grep -q "NVM_DIR" ~/.bashrc; then
    echo "Adding NVM to bash profile..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
fi

# Create helpful aliases for NVM
echo "Creating NVM aliases..."
cat >> ~/.bash_aliases << EOL
alias node-lts='nvm use --lts'
alias node-latest='nvm use node'
alias node-which='nvm current'
alias node-list='nvm ls'
EOL

echo "Installation completed! Please restart your terminal or run: source ~/.bashrc"
