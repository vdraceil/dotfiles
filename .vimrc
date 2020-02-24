set nocompatible
let mapleader=','

" Vundle
let isVundleInstalled=filereadable(expand('~/.vim/bundle/vundle/README.md'))
let installPlugins=0
if !isVundleInstalled
    echo 'Installing Vundle...'
    echo ''
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let installPlugins=1
endif

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

" ------------------------------------------------------------------------------

" Lightline
Plugin 'itchyny/lightline.vim'

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileType()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '*') : ''
endfunction

function! LightlineFileEncoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'molokai'
let g:lightline.active = {}
let g:lightline.active.left = [ ['mode', 'paste'],
    \ ['readonly', 'filename', 'modified'] ]
let g:lightline.active.right = [ ['lineinfo'], ['percent'],
    \ ['filetype', 'fileencoding'] ]
let g:lightline.component_function = {}
let g:lightline.component_function.filetype = 'LightlineFileType'
let g:lightline.component_function.fileformat = 'LightlineFileFormat'
let g:lightline.component_function.fileencoding = 'LightlineFileEncoding'

" ------------------------------------------------------------------------------

" NERDTree
Plugin 'scrooloose/nerdtree'

let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
let g:NERDTreeIgnore=['\.class$', '\.pyc$', '\.git$', '\.cache$', '^node_modules$', '^__pycache__$']

nnoremap <silent> <F9> :NERDTreeToggle<cr>
nnoremap <leader>nb :Bookmark<cr>

" Open NERDTree when vim is opened with no argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only open window is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------------------------------------------

" EasyMotion
Plugin 'Lokaltog/vim-easymotion'

" with this, 'v' will match both 'v' and 'V', but 'V' will match 'V' only
let g:Easymotion_smartcase=1

map / <Plug>(easymotion-sn)| " bi-directional find characters
omap / <Plug>(easymotion-tn)| " till before characters to the right
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
nmap f <Plug>(easymotion-fl)| " 1 char, in line, forward
nmap F <Plug>(easymotion-Fl)| " 1 char, in line, backward
nmap <leader>f <Plug>(easymotion-f)| " 1 char, forward
nmap <leader>F <Plug>(easymotion-F)| " 1 char, backward

" ------------------------------------------------------------------------------

" CtrlP
Plugin 'kien/ctrlp.vim'

let g:ctrlp_working_path_mode='ra'
let g:ctrlp_mruf_max=50
let g:ctrlp_max_depth=20
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir='~/.vim/ctrlp'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\.git$\|dist$\|build$\|node_modules$\|env$',
    \ 'file': '\.svg$\|\.pyc$',
  \ }
let g:ctrlp_prompt_mappings={
  \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
  \ 'AcceptSelection("t")': ['<cr>'],
  \ }

function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

nnoremap <leader>P :CtrlP<cr>
nnoremap <leader>M :CtrlPMRUFiles<cr>
nnoremap <leader>L :CtrlPLine<cr>
" Same as previous mappings, but calling with word under cursor as default text
nnoremap <leader>Pw :call CtrlPWithSearchText(expand('<cword>'), '')<cr>
nnoremap <leader>Mw :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<cr>
nnoremap <leader>Lw :call CtrlPWithSearchText(expand('<cword>'), 'Line')<cr>

" ------------------------------------------------------------------------------

" Tagbar
Plugin 'majutsushi/tagbar'

let g:tagbar_width=40
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_show_linenumbers=2

nnoremap <silent> <F10> :TagbarToggle<cr>

" ------------------------------------------------------------------------------

" Deoplete
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

set runtimepath+=~/.vim/bundle/deoplete.nvim
set completeopt+=noinsert
set completeopt-=preview

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('max_list', 15)
call deoplete#custom#option('smart_case', v:true)

let g:deoplete#enable_at_startup = 1

inoremap <expr> <esc> pumvisible() ? deoplete#close_popup()."\<esc>" : "\<esc>"
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ------------------------------------------------------------------------------

" Ultisnips
Plugin 'SirVer/ultisnips'

let g:UltiSnipsSnippetDirectories=["quick-snippets"]
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<leader>sl"
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" ------------------------------------------------------------------------------

" Others
" Vim Surround
Plugin 'tpope/vim-surround'

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" Vim CSS Color Highlight
Plugin 'ap/vim-css-color'

" ------------------------------------------------------------------------------

" Color Schemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'

" ------------------------------------------------------------------------------

call vundle#end()
filetype plugin indent on

" Install the above plugins
if installPlugins
    echo 'Installing Plugins...'
    echo ''
    :PluginInstall
endif

" ------------------------------------------------------------------------------

" Settings
colorscheme gruvbox

" Basic
set encoding=utf-8
set dict=/usr/share/dict/words
set autoread
set synmaxcol=0
set term=screen-256color
set history=1000
set undofile
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
if !isdirectory(&undodir)
    call mkdir(&undodir)
endif
if !isdirectory(&directory)
    call mkdir(&directory)
endif
syntax enable

" Visual Cues
set noshowmode
set showmatch
set showcmd
set incsearch
set hlsearch
set wildmenu
set listchars=tab:»·,trail:·,extends:>,precedes:<,eol:¬
set visualbell
set number
set display=uhex
set fileformats=unix,dos
" Show warning at line #80 and danger (background change) #120
"let &colorcolumn='80,'.join(range(120,999), ',')
let &colorcolumn="80,120"
highlight colorcolumn ctermbg=235 guibg=#2c2d27

" UI
set laststatus=2
set shortmess=aIT
set cmdheight=2
set shiftround
set linespace=0
set ttymouse=xterm2
set foldcolumn=1
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" Tab length exceptions on some file types
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
" When scrolling keep cursor 3 lines away from screen border
set scrolloff=3
" Open splits below and right by default
set splitbelow
set splitright
" Paste mode
set pastetoggle=<F11>

" Text Format
set wrap
set autoindent
set completeopt=menu
set backspace=indent,eol,start
set numberwidth=6
set list

" OS Specific
if system('uname -s') == "Darwin\n"
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif

" Auto Commands
" I do not really move in Insert mode. Taking advantage of that fact.
autocmd InsertEnter * silent! :set number
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" ------------------------------------------------------------------------------

" Mappings
" Save as sudo
ca w!! w !sudo tee "%"

" Navigation
nmap <down> <nop>
nmap <up> <nop>
nmap <left> <nop>
nmap <right> <nop>

imap <down> <nop>
imap <up> <nop>
imap <left> <nop>
imap <right> <nop>

vmap <down> <nop>
vmap <up> <nop>
vmap <left> <nop>
vmap <right> <nop>

" Word Capitalizations
nnoremap <leader>U gUiw
inoremap <leader>U <esc>gUiw:i
vnoremap <leader>U <esc>iwU
nnoremap <leader>u guiw
inoremap <leader>u <esc>guiw:i
vnoremap <leader>u <esc>iwu

" Copy/Paste from/to OS's Clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Normal Mode - Specifics
" Clear highlight
nnoremap <leader><space> :noh<cr>
" Edit & Source .vimrc on the fly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:echom "$MYVIMRC Sourced Successfully!"<cr>

" Tabs
" Navigation
nnoremap tr :tabprev<cr>
nnoremap trr :tabfirst<cr>
nnoremap ty :tabnext<cr>
nnoremap tyy :tablast<cr>
nnoremap tt :tabnew<cr>
nnoremap tm :tabm<cr>

" Splits
" Navigation
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
" Move current split to a new tab
nnoremap <leader>t <c-w>T
" Rotate
nnoremap <leader>> <c-w>r
nnoremap <leader>< <c-w>R
" Resize - Vertical
nnoremap + <c-w>>
nnoremap - <c-w><

" Buffers
" Navigation
nnoremap bv :bprev<cr>
nnoremap bvv :bfirst<cr>
nnoremap bn :bnext<cr>
nnoremap bnn :blast<cr>
" List
nnoremap bl :buffers<cr>
" Delete
nnoremap bd :bdelete<cr>

" Insert Mode - Specifics
" Exit Insert Mode
inoremap jk <esc>

" Quick Pairs
inoremap <leader>' ''<esc>i
inoremap <leader>" ""<esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

" ------------------------------------------------------------------------------

" Abbreviations
iabbrev vdg@ vdraceil@gmail.com
iabbrev vdy@ vdraceil@yahoo.co.in
