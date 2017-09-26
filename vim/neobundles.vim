set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundles/'))
    call dein#begin(expand('~/.vim/bundles/'))

    " Let dein manage dein
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/denite.nvim')

    " Source control
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')

    " Auto-completion
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('zchee/deoplete-jedi')

    " File browsing
    call dein#add('scrooloose/nerdtree')

    " Status line
    call dein#add('itchyny/lightline.vim')

    " Colors
    call dein#add('flazz/vim-colorschemes')

    " Debugging
    call dein#add('joonty/vdebug')

    " Alignment
    call dein#add('godlygeek/tabular')

    " Utils
    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('rking/ag.vim')
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('pearofducks/ansible-vim')

    " Python
    call dein#add('nvie/vim-flake8')
    call dein#add('vim-scripts/indentpython.vim')

    " Golang
    call dein#add('fatih/vim-go')

    call dein#end()
    call dein#save_state()
endif

" Install new plugins on startup
if dein#check_install()
    call dein#install()
endif
