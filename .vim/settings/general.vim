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
set cursorline
set showcmd
set incsearch
set hlsearch
set wildmenu
set display=uhex
set colorcolumn=+2
set listchars=tab:» ,trail:·,extends:>,precedes:<,eol:¬
set visualbell

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
set mouse=a
set ttymouse=xterm2
set foldcolumn=1

" Text Format
set wrap
set autoindent
set textwidth=120
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
let maplocalleader=‘`’
