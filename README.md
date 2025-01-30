# DevSecOps Environment Setup

This repository contains scripts and documentation for setting up a complete DevSecOps development environment on both Windows 11 and Debian-based Linux systems. The setup includes development tools, security scanning, containerization, and CI/CD tools, with a focus on Node.js development using NVM (Node Version Manager).

## Features

- Node.js development environment with NVM
- Docker and container tools
- Kubernetes tools (kubectl, Helm)
- Security scanning tools
- Testing frameworks
- CI/CD tools
- Development tools and IDE

## Prerequisites

### Windows 11
- Windows 11 Pro, Enterprise, or Education (required for Hyper-V)
- PowerShell running as Administrator
- Internet connection
- At least 16GB of RAM recommended
- 50GB of free disk space

### Debian-based Linux
- Debian/Ubuntu-based distribution
- Sudo privileges
- Internet connection
- At least 8GB of RAM recommended
- 30GB of free disk space

## Installation

### Windows 11 Setup

1. Open PowerShell as Administrator
2. Navigate to the script directory
3. Run the following commands:
```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\win.ps1
```

### Debian-based Linux Setup

1. Open Terminal
2. Navigate to the script directory
3. Run the following commands:
```bash
chmod +x debian.sh
./debian.sh
```

## Post-Installation Steps

### Node.js Environment (Both Systems)

1. Verify NVM installation:
```bash
nvm --version
```

2. List installed Node.js versions:
```bash
nvm ls
```

3. Switch between Node.js versions:
```bash
# Use LTS version
nvm use --lts

# Use latest version
nvm use node

# Use specific version
nvm use 16.14.0
```

### Docker Setup

1. Verify Docker installation:
```bash
docker --version
docker-compose --version
```

2. Test Docker:
```bash
docker run hello-world
```

### Kubernetes Tools

1. Verify installations:
```bash
kubectl version --client
helm version
```

## Directory Structure

The setup creates the following workspace structure:

```
Windows:
%USERPROFILE%\Dev\
├── projects\
├── scripts\
└── docker\

Linux:
~/Dev/
├── projects\
├── scripts\
└── docker\
```

## Included Tools and Components

### Development Tools
- Node.js (managed by NVM)
- TypeScript & ts-node
- Git
- Visual Studio Code
- Windows Terminal (Windows only)
- WSL2 (Windows only)

### Security Tools
- Snyk
- npm-audit-fix
- Built-in system security features

### Containerization & Orchestration
- Docker
- Docker Compose
- Podman
- Skopeo
- Kubernetes CLI (kubectl)
- Helm

### CI/CD Tools
- GitLab Runner
- Jest
- Newman

### Monitoring
- PM2 for Node.js process management

## VS Code Extensions

The setup includes essential VS Code extensions:
- ESLint
- Prettier
- Docker
- Remote Containers
- PowerShell (Windows only)
- Kubernetes Tools

## Troubleshooting

### Common Issues on Windows

1. Hyper-V not enabled:
   - Enable Hyper-V in Windows Features
   - Restart your computer

2. WSL2 installation fails:
   - Run `wsl --update`
   - Enable Virtual Machine Platform

### Common Issues on Linux

1. Docker permissions:
```bash
# Add current user to docker group
sudo usermod -aG docker $USER
newgrp docker
```

2. NVM not found after installation:
```bash
# Source profile
source ~/.bashrc
```

## Maintenance

### Updating Tools

1. Node.js:
```bash
nvm install --lts
nvm install node
```

2. Global npm packages:
```bash
npm update -g
```

3. Docker:
```bash
# Windows: Through Docker Desktop
# Linux:
sudo apt update
sudo apt upgrade docker-ce
```

### System Cleanup

1. Remove old Node.js versions:
```bash
nvm ls
nvm uninstall <version>
```

2. Docker cleanup:
```bash
docker system prune -a
```

## Contributing

Feel free to submit issues and enhancement requests, or contribute to the scripts:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
