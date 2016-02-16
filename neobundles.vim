set runtimepath^=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Source control
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Auto-completion
NeoBundle 'Valloric/YouCompleteMe'

" File browsing
NeoBundle 'scrooloose/nerdtree'

" Status line
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'vim-airline/vim-airline'
"NeoBundle 'vim-airline/vim-airline-themes'
"NeoBundle 'edkolev/tmuxline.vim'

" Colors
NeoBundle 'flazz/vim-colorschemes'

NeoBundleLazy 'nvie/vim-flake8', {
\ 'autoload': { 'filetypes': ['python'] }
\}
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
\ 'autoload': {'filetypes': ['python']}
\}
NeoBundleLazy 'fatih/vim-go', {
\ 'autoload': { 'filetypes': ['go'] }
\}

call neobundle#end()
NeoBundleCheck
