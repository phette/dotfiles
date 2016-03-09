#!/usr/bin/env bash

# Get the absolute path to this file.
DIR="$(cd "$(dirname "$0")" && pwd)"

# Back up neobundle.vim if it was previously installed.
# It will be replaced with a symlink.
if [ -d $HOME/.vim/bundle/neobundle.vim ]; then
    if [ ! -L $HOME/.vim/bundle/neobundle.vim ]; then
        mv -v $HOME/.vim/bundle/neobundle.vim $HOME/.vim/bundle/neobundle.vim.bak
    fi
fi

# Symlink necessary files and directories.
ln -sfv $DIR/shell/bash_profile         $HOME/.bash_profile
ln -sfv $DIR/shell/inputrc              $HOME/.inputrc
ln -sfv $DIR/shell/ackrc                $HOME/.ackrc
ln -sfv $DIR/shell/liquidpromptrc       $HOME/.liquidpromptrc
ln -sfv $DIR/git/gitconfig              $HOME/.gitconfig
ln -sfv $DIR/git/gitignore              $HOME/.gitignore
ln -sfv $DIR/vim/vimrc                  $HOME/.vimrc
ln -sfv $DIR/vim/gvimrc                 $HOME/.gvimrc
ln -sfv $DIR/vim/neobundle.vim          $HOME/.vim/bundle/

# Install brew (if necessary) and useful packages and fonts.
which brew
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew install bash
    brew install bash-completion
    brew install macvim --override-system-vim
    brew install coreutils
    brew install git
    brew install git-flow
    brew install git-lfs
    brew install grep
    brew install ack
    brew install the_silver_searcher
    brew install wget
    brew install node
    brew install python
    brew install python3
    brew install go
    brew install composer
    brew install mysql
    brew install mongodb
    brew install memcached
    brew install redis
    brew install lastpass-cli

    brew tap caskroom/fonts
    brew cask install font-inconsolata-dz
else
    brew update
    brew upgrade
fi
