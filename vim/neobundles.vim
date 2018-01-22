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

    " Alignment
    call dein#add('godlygeek/tabular')

    " Highlight erroneous whitespace
    call dein#add('ntpeters/vim-better-whitespace')

    " Search
    call dein#add('rking/ag.vim')
    call dein#add('ctrlpvim/ctrlp.vim')

    " Open terminal buffer in split terminal
    "call dein#add('vimlab/split-term.vim')

    " Ansible
    call dein#add('pearofducks/ansible-vim')

    " Python
    call dein#add('nvie/vim-flake8')
    call dein#add('vim-scripts/indentpython.vim')

    " Javascript
    call dein#add('pangloss/vim-javascript')
    call dein#add('ternjs/tern_for_vim', {'do': 'npm install'})
    call dein#add('carlitux/deoplete-ternjs', {'do': 'npm install -g tern'})

    " Node.js
    call dein#add('moll/vim-node')

    " Mustache
    call dein#add('mustache/vim-mustache-handlebars')

    " Golang
    call dein#add('fatih/vim-go')

    call dein#end()
    call dein#save_state()
endif

" Install new plugins on startup
if dein#check_install()
    call dein#install()
endif
