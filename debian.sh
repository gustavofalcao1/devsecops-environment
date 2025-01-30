#!/bin/bash

# Update system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install basic development tools
echo "Installing development essentials..."
sudo apt install -y build-essential git curl wget

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install TypeScript globally
echo "Installing TypeScript..."
sudo npm install -g typescript ts-node

# Install security tools
echo "Installing security tools..."
sudo npm install -g snyk
sudo npm install -g npm-audit-fix

# Install testing frameworks
echo "Installing testing tools..."
sudo npm install -g jest
sudo npm install -g newman

# Install monitoring tools
echo "Installing monitoring tools..."
sudo npm install -g pm2

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

# Install VS Code (optional)
echo "Installing VS Code..."
sudo snap install code --classic

# Create default workspace
echo "Creating workspace structure..."
mkdir -p ~/Dev/projects
mkdir -p ~/Dev/scripts
mkdir -p ~/Dev/docker

# Setup Git configuration
echo "Configuring Git..."
git config --global init.defaultBranch main
