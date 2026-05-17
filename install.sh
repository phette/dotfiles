#!/usr/bin/env bash

# Install Homebrew if missing, then all packages via brew.sh
if ! command -v brew &>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Fresh install leaves brew off PATH for this shell; load shellenv explicitly
if ! command -v brew &>/dev/null; then
    for __brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
        if [[ -x "$__brew" ]]; then
            eval "$("$__brew" shellenv)"
            break
        fi
    done
fi

# Install oh-my-zsh (unattended; keep existing ~/.zshrc — e.g. symlink to dotfiles)
if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

DIR="$(cd "$(dirname "$0")" && pwd)"
bash "$DIR/brew.sh"

# Pipenv shell completion (register-python-argcomplete); Homebrew pipenv has no extras syntax
pip3 install --upgrade argcomplete

# Symlink necessary files and directories.
ln -sfv $DIR/shell/zshrc     $HOME/.zshrc
ln -sfv $DIR/shell/ripgreprc $HOME/.ripgreprc
ln -sfv $DIR/git/gitconfig    $HOME/.gitconfig
ln -sfv $DIR/git/gitignore   $HOME/.gitignore

# Symlink kickstart-based Neovim config from dotfiles.
mkdir -p "$HOME/.config"
ln -sfn "$DIR/nvim" "$HOME/.config/nvim"

# Verify Neovim is installed before bootstrapping kickstart plugins.
if ! command -v nvim &>/dev/null; then
    echo "Error: nvim not found. Ensure brew.sh ran successfully." >&2
    exit 1
fi

# Headless plugin install so the first interactive launch is fast.
nvim --headless "+lua vim.pack.update()" +qa

# Make default shell is zsh.
# Make sure the zsh executable exists in /etc/shells.
chsh -s $(which zsh)
