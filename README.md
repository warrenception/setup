# Dev Environment Setup

Ansible-based provisioning tool for a consistent development environment across Ubuntu/Debian and macOS. Includes CLI utilities, shell config, and editor setup.

## Quick Start

```bash
# Run on your machine (prompts for vault + sudo passwords)
make local

# Or test in Docker first
make run
```

## What Gets Installed

| Tool | Method | Task File |
|------|--------|-----------|
| ZSH + Oh-My-Zsh | apt/brew | `tasks/zsh.yml` |
| Python 3.12 | UV | `tasks/python.yml` |
| Node.js LTS | fnm + pnpm | `tasks/node.yml` |
| Rust | rustup | `tasks/rust.yml` |
| Foundry + SVM | foundryup | `tasks/ethereum.yml` |
| Docker Desktop | Homebrew (macOS) | `tasks/docker.yml` |
| SSH Keys | ansible-vault | `tasks/ssh.yml` |

### Selective Installation

Run specific tasks using tags:

```bash
make local ANSIBLE_TAGS="--tags node"
make local ANSIBLE_TAGS="--tags python,rust"
```

## Makefile Targets

| Target | Description |
|--------|-------------|
| `make local` | Run playbook on host machine |
| `make run` | Build + run playbook in Docker |
| `make build` | Build Docker image only |
| `make clean` | Remove Docker container and image |
| `make encrypt_ssh` | Encrypt SSH keys with ansible-vault |

## CLI Scripts (`bin/`)

Added to PATH via `zshrc`. Require Claude CLI.

### `commit`

AI-powered git commit message generator.

```bash
commit  # Stages all, generates message, prompts for confirmation
```

### `how`

Quick command helper.

```bash
how compress this folder
how find files larger than 100MB
```

### `news`

Tech news aggregator (HN, Lobsters, Elucid).

```bash
news              # All sources
news hn           # Hacker News only
news --summarize  # AI-summarized briefing
```

### `rr`

Article reader/summarizer.

```bash
rr <url>          # Fetch and summarize
rr <url> --save   # Save to ~/reads/
```

## Shell Configuration (`zshrc`)

### Modern CLI Aliases

| Alias | Command |
|-------|---------|
| `ls` | `eza` |
| `ll` | `eza -la` |
| `cat` | `bat` |
| `find` | `fd` |
| `grep` | `rg` |
| `diff` | `delta` |

### Git Aliases

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `glo` | `git log --oneline --graph -20` |
| `gri N` | `git rebase -i HEAD~N` |
| `gco` | `git checkout` |
| `gb` | `git branch` |
| `gp` | `git push` |
| `ga` | `git add` |
| `gaa` | `git add -A` |

### Foundry Aliases

| Alias | Command |
|-------|---------|
| `ft` | `forge test` |
| `ftv` | `forge test -vvv` |
| `fb` | `forge build` |
| `fc` | `forge coverage` |
| `fs` | `forge snapshot` |

### Utility Functions

| Function | Description |
|----------|-------------|
| `killport <port>` | Kill process on port |
| `extract <file>` | Smart archive extraction |
| `mkcd <dir>` | mkdir + cd |
| `create <path>` | Create file with parent dirs |
| `cpaste [file]` | Paste clipboard image to file |

### Quick Utilities

| Alias | Description |
|-------|-------------|
| `reload` | Source ~/.zshrc |
| `ports` | List listening ports |
| `ip` | Show public IP |

## Editor & Terminal Configs

### Ghostty (`ghostty/config`)

- Theme: TokyoNight Storm
- macOS Option-as-Alt for nvim compatibility

Copy to your system:

```bash
# macOS
cp ghostty/config "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# Linux
cp ghostty/config "$HOME/.config/ghostty/config"
```

### LazyGit (`lazygit/config.yml`)

High-contrast theme for better diff visibility.

```bash
# macOS
ln -sf /path/to/setup/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

# Linux
ln -sf /path/to/setup/lazygit/config.yml ~/.config/lazygit/config.yml
```

### Neovim (`nvim/`)

Full config with LSP, Treesitter, Telescope, Copilot, LazyGit. See `nvim/README.md`.

### Zed (`keybindings/zed/`)

Custom keymap and settings for Zed editor.

## SSH Key Management

Encrypted keys stored in `.ssh/*.vault` using ansible-vault.

**Encrypt new keys:**

```bash
make encrypt_ssh
# Looks for keys in ~/.ssh/kobe-eth/
# Outputs to .ssh/*.vault
```

**Decryption** happens automatically during `make local` or `make run`.

## Requirements

- Ansible (`pip install ansible` or `brew install ansible`)
- Docker (for `make run` testing)
- Claude CLI (for `bin/` scripts)
