" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

" Improvement
set nocompatible

if has('vim_starting')
    source neobundles.vim
endif

" Open gvim/mvim full screen with a little transparency
if has('gui_running')
    set columns=999
    set lines=999
    "set transparency=7
endif

filetype plugin indent on
syntax on

" Font
try
    set guifont=Inconsolata:h12
catch
endtry

try
    colorscheme desertEx
catch
    colorscheme desert
endtry
"highlight Pmenu ctermfg=0 ctermbg=13 guifg=#e0e2e4 guibg=#66747b
"highlight PmenuSel ctermfg=8 ctermbg=0 guibg=DarkGrey

set history=1000
set autoread
set cursorline
set so=7
set ruler
set cmdheight=2
set hid
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set backspace=indent,eol,start
set number
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set showcmd
set hidden
set modeline
set novisualbell
set noerrorbells
set nobackup
set nowb
set noswapfile
set wildmenu
set wildmode=list:longest
set laststatus=2
set noshowmode
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
let g:mapleader=","

nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q<CR>

map <C-n> :NERDTreeToggle<CR>

" Option + j/k keys to move lines up and down
nnoremap ∆ :m+<CR>==
nnoremap ˚ :m-2<CR>==
inoremap ∆ <Esc>:m+<CR>==gi
inoremap ˚ <Esc>:m-2<CR>==gi
vnoremap ∆ :m'>+<CR>gv=gv
vnoremap ˚ :m-2<CR>gv=gv

"nnoremap <silent> <F5> :!clear;python %<CR>

" Shift + up/down scrolls the page 1 line at a time
map <Down> <C-E>
map <Up> <C-Y>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Call flake8 every time a Python file is saved
"autocmd BufWritePost *.py call Flake8()

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close YCM preview window often
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" Lightline configuration
let g:lightline = {
\   'colorscheme': 'wombat',
\ }

" Airline configuration
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
