" Basic
set encoding=utf-8
set dict=/usr/share/dict/words
set autoread
syntax enable
set synmaxcol=0
set term=screen-256color
set nocompatible
set ffs=unix
set undofile
set undodir=~/.vim/undo/
set history=1000

" Visual Cues
set showmatch
set showcmd
set incsearch
set hlsearch
set wildmenu
set display=uhex
set listchars=tab:»·,trail:·,extends:>,precedes:<,eol:¬
set visualbell
" Show warning at line #80 and danger (background change) #120
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" UI
set laststatus=2
set shortmess=aIT
set cmdheight=2
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set linespace=0
set ttymouse=xterm2
set foldcolumn=1

" Text Format
set wrap
set autoindent
set completeopt=menu
set backspace=indent,eol,start
set numberwidth=6
set list

" Auto Commands
" I do not really move in Insert mode. Taking advantage of that fact.
autocmd InsertEnter * silent! :set number
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Others
let mapleader='\'
let maplocalleader='`'
