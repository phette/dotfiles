#!/bin/sh

##############################################################################
# Bash
##############################################################################
ln -sfv "`pwd`/bash/bash_profile" ~/.bash_profile
ln -sfv "`pwd`/bash/inputrc" ~/.inputrc
ln -sfv "`pwd`/bash/ackrc" ~/.ackrc

##############################################################################
# Vim
##############################################################################
ln -sfv "`pwd`/vim/vimrc" ~/.vimrc
ln -sfv "`pwd`/vim/gvimrc" ~/.gvimrc

if [ -d ~/.vim/bundle/neobundle.vim ]; then
    if [ ! -L ~/.vim/bundle/neobundle.vim ]; then
        mv -v ~/.vim/bundle/neobundle.vim ~/.vim/bundle/neobundle.vim.bak
    fi
fi

ln -sfv "`pwd`/vim/neobundle.vim" ~/.vim/bundle/
