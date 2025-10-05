# Development Environment Setup

An automated development environment setup tool that uses Ansible playbooks to configure a consistent development environment across different operating systems (Ubuntu/Debian and MacOS).

## Features

- 🛠️ **Cross-platform Support**: Works on both Ubuntu/Debian and MacOS systems
- 🐚 **Shell Setup**: Installs and configures ZSH with Oh-My-Zsh and useful plugins
- 🐍 **Python Environment**: Sets up Python 3.12 using UV package manager
- 📦 **Node.js Environment**: Installs Node.js (LTS) via fnm and PNPM package manager
- ⚒️ **Ethereum Development**: Includes Foundry toolkit for Ethereum development

## Ghostty Terminal Config

The repo ships a Ghostty configuration at `files/ghostty/config` with custom pane navigation and resize keybindings. After cloning this repo, drop it onto a new machine with one of the commands below (run from the repo root):

```sh
cp "$PWD/files/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
```

For Linux systems:

```sh
cp "$PWD/files/ghostty/config" "$HOME/.config/ghostty/config"
```

## TODO

- [x] SSH Keys & Various Private Keys
- [x] Docker
