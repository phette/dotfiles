#!/bin/sh

# Get the absolute path to this file.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Back up neobundle.vim if it was previously installed.
# It will be replaced with a symlink.
if [ -d $HOME/.vim/bundle/neobundle.vim ]; then
    if [ ! -L $HOME/.vim/bundle/neobundle.vim ]; then
        mv -v $HOME/.vim/bundle/neobundle.vim $HOME/.vim/bundle/neobundle.vim.bak
    fi
fi

# Symlink necessary files and directories.
ln -sfv $DIR/shell/bash_profile $HOME/.bash_profile
ln -sfv $DIR/shell/inputrc      $HOME/.inputrc
ln -sfv $DIR/shell/ackrc        $HOME/.ackrc
ln -sfv $DIR/vim/vimrc          $HOME/.vimrc
ln -sfv $DIR/vim/gvimrc         $HOME/.gvimrc
ln -sfv $DIR/vim/neobundle.vim  $HOME/.vim/bundle/
