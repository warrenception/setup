# Neovim Config

Minimal setup for Solidity + TypeScript development.

## Installation

```bash
# Symlink config
ln -s /path/to/setup/nvim ~/.config/nvim
ln -s /path/to/setup/ghostty ~/.config/ghostty

# Install language servers
npm i -g typescript-language-server typescript @nomicfoundation/solidity-language-server

# Open nvim - plugins auto-install
nvim
```

## Keybindings Cheatsheet

### Navigation

| Key | Action |
|-----|--------|
| `Option+h/j/k/l` | Navigate splits |
| `Option+d` | Half-page down |
| `Option+u` | Half-page up |
| `Ctrl+o` | Jump back |
| `Ctrl+i` | Jump forward |

### Splits & Buffers

| Key | Action |
|-----|--------|
| `Option+o` | Vertical split |
| `Option+-` | Horizontal split |
| `Option+w` | Close split |
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |

### File Finding

| Key | Action |
|-----|--------|
| `Cmd+p` | Find files |
| `Cmd+g` | Grep in repo |
| `Space b` | Open buffers |
| `Space r` | Recent files |

### LSP (Code Intelligence)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover docs |
| `Space rn` | Rename symbol |
| `Space ca` | Code action |
| `Space e` | Show error |
| `[d` / `]d` | Prev/next diagnostic |

### Search & Replace

| Key | Action |
|-----|--------|
| `Option+r` | Replace word in file |
| `Option+Shift+r` | Replace word across repo |
| `/pattern` | Search in file |
| `n` / `N` | Next/prev match |
| `Esc` | Clear search highlight |

### Git

| Key | Action |
|-----|--------|
| `Option+g` | Diff all changed files |
| `Option+Shift+g` | File history |
| `]c` / `[c` | Next/prev hunk |

### Terminal

| Key | Action |
|-----|--------|
| `Option+n` | Toggle terminal |
| `jk` | Exit terminal mode |

### Editing

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `>` / `<` (visual) | Indent/outdent (stays selected) |
| `Tab` | Accept completion/Copilot |

## Plugins

- **tokyonight.nvim** — colorscheme
- **telescope.nvim** — fuzzy finder
- **nvim-treesitter** — syntax highlighting
- **nvim-lspconfig** — LSP support
- **nvim-cmp** — completion
- **copilot.vim** — AI suggestions
- **gitsigns.nvim** — git hunks
- **diffview.nvim** — git diff viewer
- **lualine.nvim** — statusline

## Ghostty Config

Remaps `Option` as `Alt` for nvim keybindings, plus `Cmd+p` and `Cmd+g` for Telescope.
