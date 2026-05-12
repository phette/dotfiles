#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

# Install oh-my-zsh (unattended; keep existing ~/.zshrc — e.g. symlink to dotfiles)
if [[ ! -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

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

bash "$DIR/brew.sh"

# Install Python support for Neovim.
pip install --upgrade pynvim
pip3 install --upgrade pynvim

# Pipenv shell completion (register-python-argcomplete); Homebrew pipenv has no extras syntax
pip3 install --upgrade argcomplete

# Symlink necessary files and directories.
ln -sfv $DIR/shell/zshrc                $HOME/.zshrc
ln -sfv $DIR/shell/bash_profile         $HOME/.bash_profile
ln -sfv $DIR/shell/inputrc              $HOME/.inputrc
ln -sfv $DIR/shell/liquidpromptrc       $HOME/.liquidpromptrc
ln -sfv $DIR/git/gitconfig              $HOME/.gitconfig
ln -sfv $DIR/git/gitignore              $HOME/.gitignore
ln -sfv $DIR/vim/vimrc                  $HOME/.vimrc
ln -sfv $DIR/vim/init.vim               $HOME/.config/nvim/init.vim

# Make default shell is zsh.
# Make sure the zsh executable exists in /etc/shells.
chsh -s $(which zsh)
