set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein/'))

" Let dein manage dein
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')

" Auto-completion
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#add('zchee/deoplete-jedi')

" Source control
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

" File browsing
call dein#add('scrooloose/nerdtree')

" Status line
call dein#add('itchyny/lightline.vim')

" Colors
call dein#add('flazz/vim-colorschemes')
call dein#add('Erichain/vim-monokai-pro')

" Alignment
call dein#add('godlygeek/tabular')

" Highlight erroneous whitespace
call dein#add('ntpeters/vim-better-whitespace')

" Search
call dein#add('rking/ag.vim')
call dein#add('ctrlpvim/ctrlp.vim')

" Python
call dein#add('nvie/vim-flake8')
call dein#add('vim-scripts/indentpython.vim')
call dein#add('ambv/black')

" Golang
call dein#add('fatih/vim-go')

call dein#end()

" Install new plugins on startup
if dein#check_install()
    call dein#install()
endif
