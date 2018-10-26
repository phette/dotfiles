#!/usr/bin/env bash

# Install brew (if necessary) and useful packages and fonts.
which brew
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew install zsh
    brew install zsh-completions
    brew install bash
    brew install bash-completion
    brew install neovim
    brew install git
    brew install grep
    brew install the_silver_searcher
    brew install wget
    brew install pyenv
    brew install pyenv-virtualenv
    brew install pipenv
    brew install go
else
    brew update
    brew upgrade
fi

# Install Python support for Neovim.
pip install --upgrade neovim
pip3 install --upgrade neovim

# Install dein (for vim/neovim).
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein

# Get the absolute path to this file.
DIR="$(cd "$(dirname "$0")" && pwd)"

# Symlink necessary files and directories.
ln -sfv $DIR/shell/zshrc                $HOME/.zshrc
ln -sfv $DIR/shell/bash_profile         $HOME/.bash_profile
ln -sfv $DIR/shell/inputrc              $HOME/.inputrc
ln -sfv $DIR/shell/liquidpromptrc       $HOME/.liquidpromptrc
ln -sfv $DIR/git/gitconfig              $HOME/.gitconfig
ln -sfv $DIR/git/gitignore              $HOME/.gitignore
ln -sfv $DIR/vim/vimrc                  $HOME/.config/nvim/init.vim

# Make default shell is zsh.
# Make sure the zsh executable exists in /etc/shells.
chsh -s $(which zsh)
