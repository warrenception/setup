# Path
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin/:$HOME/nvim-macos-arm64/bin
export PATH="$HOME/work/setup/bin:$PATH"
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export ARCHFLAGS="-arch arm64"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# fnm (lazy load)
if [[ -d "$HOME/.fnm" ]]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env)"
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Completion
autoload -Uz compinit
compinit -C  # -C skips security check, faster

# Plugins (homebrew)
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Prompt (starship - must be last)
eval "$(starship init zsh)"

# Editor
alias code="nvim"

# Modern CLI replacements
alias ls="eza"
alias ll="eza -la"
alias la="eza -a"
alias lt="eza --tree"
alias cat="bat"
alias find="fd"
alias grep="rg"
alias diff="delta"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git shortcuts
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git pull"
alias glo="git log --oneline --graph -20"
alias gco="git checkout"
alias gb="git branch"
alias gp="git push"
alias gcm="git commit -m"
alias ga="git add"
alias gaa="git add -A"
alias gri='function _gri() { git rebase -i HEAD~$1; }; _gri'

# Foundry/Solidity
alias ft="forge test"
alias ftv="forge test -vvv"
alias fb="forge build"
alias fc="forge coverage"
alias fs="forge snapshot"

# Python via uv
alias py="uv run python"
alias pip="uv pip"

# Quick utilities
alias reload="source ~/.zshrc"
alias ports="lsof -i -P -n | grep LISTEN"
alias ip="curl -s ipinfo.io/ip"

# Utility functions
killport() { lsof -ti:"$1" | xargs kill -9 2>/dev/null || echo "No process on port $1"; }

extract() {
  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz)  tar xzf "$1" ;;
    *.tar.xz)  tar xJf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.rar)     unrar x "$1" ;;
    *.7z)      7z x "$1" ;;
    *)         echo "Unknown format: $1" ;;
  esac
}

mkcd() { mkdir -p "$1" && cd "$1"; }
create() { mkdir -p "$(dirname "$1")" && touch "$1"; }

cpaste() {
  local dir="$HOME/Screenshots"
  [[ -d "$dir" ]] || mkdir -p "$dir"
  local file="${1:-$dir/clipboard_$(date +%Y%m%d_%H%M%S).png}"
  pngpaste "$file" && echo "$file" | tee >(pbcopy)
}
