# 🛡️ DevSecOps Environment Setup

A cross-platform scripting environment for setting up a modern **DevSecOps development stack** on both **Windows 11** and **Debian-based Linux**. It includes tools for Node.js development, containerization, Kubernetes, security scanning, CI/CD, and more — tailored for developers who want a unified, automated setup.

---

## ✨ Key Features

- 📦 Node.js development with **NVM**
- 🐳 Docker, Podman & container ecosystem
- ☸️ Kubernetes CLI tools (kubectl, Helm)
- 🔐 Security scanners (Snyk, npm audit)
- 🔁 CI/CD toolchain (GitLab Runner, Jest, Newman)
- 🧰 Developer IDE & VS Code extensions
- 🖥️ Support for both **Windows 11** and **Linux**

---

## ⚙️ Prerequisites

### Windows 11
- Windows 11 Pro, Enterprise, or Education (for Hyper-V)
- PowerShell (Run as Administrator)
- Internet connection
- 16GB+ RAM recommended
- 50GB+ disk space

### Debian-based Linux (Ubuntu, etc.)
- Sudo privileges
- Internet connection
- 8GB+ RAM recommended
- 30GB+ disk space

---

## 📦 Installation

### 🔧 Windows Setup
```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\win.ps1
```

### 🐧 Linux Setup
```bash
chmod +x debian.sh
./debian.sh
```

---

## 🧪 Post-Installation Verification

### Node.js (via NVM)
```bash
nvm --version
nvm ls
nvm use --lts
nvm use node
nvm use 16.14.0
```

### Docker
```bash
docker --version
docker-compose --version
docker run hello-world
```

### Kubernetes Tools
```bash
kubectl version --client
helm version
```

---

## 🗂️ Directory Structure

### Windows:
```
%USERPROFILE%\Dev\
├── projects\
├── scripts\
└── docker\
```

### Linux:
```
~/Dev/
├── projects/
├── scripts/
└── docker/
```

---

## 🔍 Included Tools

### Development
- Node.js (via NVM)
- TypeScript & ts-node
- Git
- Visual Studio Code
- Windows Terminal (Windows only)
- WSL2 (Windows only)

### Security
- Snyk CLI
- `npm audit fix`
- Built-in OS security features

### Containers & Orchestration
- Docker & Docker Compose
- Podman & Skopeo
- Kubernetes CLI (kubectl)
- Helm

### CI/CD & Testing
- GitLab Runner
- Jest
- Newman (Postman CLI)

### Monitoring
- PM2 for Node.js process control

---

## 💻 VS Code Extensions (Installed)

- ESLint
- Prettier
- Docker
- Remote Containers
- PowerShell (Windows only)
- Kubernetes Tools

---

## 🧰 Troubleshooting

### Windows
- **Hyper-V Not Enabled**:
  - Enable via Windows Features
  - Reboot required

- **WSL2 Fails to Install**:
  - Run `wsl --update`
  - Enable Virtual Machine Platform

### Linux
- **Docker Permission Issue**:
```bash
sudo usermod -aG docker $USER
newgrp docker
```

- **NVM Not Found**:
```bash
source ~/.bashrc
```

---

## 🔄 Maintenance

### Update Tools
```bash
nvm install --lts
nvm install node
npm update -g
```

### Update Docker (Linux)
```bash
sudo apt update
sudo apt upgrade docker-ce
```

### Clean Up
```bash
nvm uninstall <version>
docker system prune -a
```

---

## 🤝 Contributing

Contributions are welcome:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push and open a Pull Request

---

## 📄 License

Licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

---

## 👤 Author
**Gustavo Falcão**  
[GitHub @gustavofalcao1](https://github.com/gustavofalcao1)  
[Project Repository](https://github.com/gustavofalcao1/devsecops-environment)

---
