set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')

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
call dein#add('solarnz/thrift.vim')

" Debugging
call dein#add('joonty/vdebug')

" Alignment
call dein#add('godlygeek/tabular')

" Utils
call dein#add('mileszs/ack.vim')
call dein#add('rking/ag.vim')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('pearofducks/ansible-vim')

" Python
call dein#add('nvie/vim-flake8')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('hynek/vim-python-pep8-indent')

" Golang
call dein#add('fatih/vim-go')

call dein#end()

" Install new plugins on startup
if dein#check_install()
    call dein#install()
endif
