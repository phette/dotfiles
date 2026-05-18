#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

# ------------------------------------------------------------------------------
# 1) System prerequisites
# ------------------------------------------------------------------------------

# Install Homebrew if missing.
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Fresh installs may not have brew in PATH for this shell yet.
if ! command -v brew &>/dev/null; then
  for brew_path in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [[ -x "$brew_path" ]]; then
      eval "$("$brew_path" shellenv)"
      break
    fi
  done
fi

# ------------------------------------------------------------------------------
# 2) Package installation
# ------------------------------------------------------------------------------

bash "$DIR/brew.sh"

# oh-my-zsh install (unattended; keep existing ~/.zshrc so symlink can manage it).
if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Needed for pipenv shell completion in zshrc.
pip3 install --upgrade argcomplete

# ------------------------------------------------------------------------------
# 3) Dotfile links
# ------------------------------------------------------------------------------

# Shell + git dotfiles.
ln -sfv "$DIR/shell/zshrc" "$HOME/.zshrc"
ln -sfv "$DIR/shell/ripgreprc" "$HOME/.ripgreprc"
ln -sfv "$DIR/git/gitconfig" "$HOME/.gitconfig"
ln -sfv "$DIR/git/gitignore" "$HOME/.gitignore"

# Cursor settings (single source of truth in dotfiles).
cursor_user="$HOME/Library/Application Support/Cursor/User"
mkdir -p "$cursor_user"
ln -sfn "$DIR/vscode/settings.json" "$cursor_user/settings.json"

# Neovim config.
mkdir -p "$HOME/.config"
ln -sfn "$DIR/nvim" "$HOME/.config/nvim"

# ------------------------------------------------------------------------------
# 4) Editor bootstrap
# ------------------------------------------------------------------------------

if ! command -v nvim &>/dev/null; then
  echo "Error: nvim not found. Ensure brew.sh ran successfully." >&2
  exit 1
fi

# Pre-install/update plugins so first interactive launch is fast.
nvim --headless "+lua vim.pack.update()" +qa

# ------------------------------------------------------------------------------
# 5) Default shell
# ------------------------------------------------------------------------------

# Set default shell to zsh only when needed.
if command -v zsh &>/dev/null; then
  zsh_path="$(command -v zsh)"
  login_shell="$(dscl . -read "/Users/$(whoami)" UserShell 2>/dev/null | awk '{print $2}')"
  [[ -z "$login_shell" ]] && login_shell="$SHELL"

  if [[ "$login_shell" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
  fi
fi
