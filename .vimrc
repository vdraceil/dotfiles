" Credits
" https://github.com/aaronjensen/vimfiles
" https://github.com/fisadev/fisa-vim-config
"
" ------------------------------------------------------------------------------

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

" Airline
Plugin 'bling/vim-airline'

let g:airline_theme='murmur'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message='unknown'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#ctrlp#show_adjacent_modes=1

" ------------------------------------------------------------------------------

" NERDTree
Plugin 'scrooloose/nerdtree'

let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=['\.pyc$']

nnoremap <silent> <F9> :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nb :Bookmark <cr>

" Open NERDTree when vim is opened with no argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ------------------------------------------------------------------------------

" EasyMotion
Plugin 'Lokaltog/vim-easymotion'

let g:Easymotion_smartcase=1 " with this, 'v' will match both 'v' and 'V', but 'V' will match 'V' only

map / <Plug>(easymotion-sn)| " bi-directional find characters
omap / <Plug>(easymotion-tn)| " till before characters to the right
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)| " 2 char, bi-directional; press <cr> for 1 char match
nmap f <Plug>(easymotion-fl)| " 1 char, in line, forward
nmap F <Plug>(easymotion-Fl)| " 1 char, in line, backward
nmap <leader>f <Plug>(easymotion-f)| " 1 char, forward
nmap <leader>F <Plug>(easymotion-F)| " 1 char, backward

" ------------------------------------------------------------------------------

" Fugitive
Plugin 'tpope/vim-fugitive'

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gaa :Git add --all<cr>

" ------------------------------------------------------------------------------

" CtrlP
Plugin 'kien/ctrlp.vim'

let g:ctrlp_working_path_mode='r'
let g:ctrlp_mruf_max=50
let g:ctrlp_max_depth=20
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir='~/.vim/ctrlp'
let g:ctrlp_custom_ignore={
  \ 'dir': '\.git$',
  \ 'file': '\.pyc$',
  \ }
let g:ctrlp_prompt_mappings={
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-t>'],
  \ }

function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>l :CtrlPLine<cr>
" Same as previous mappings, but calling with word under cursor as default text
nnoremap <leader>pw :call CtrlPWithSearchText(expand('<cword>'), '')<cr>
nnoremap <leader>mw :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<cr>
nnoremap <leader>lw :call CtrlPWithSearchText(expand('<cword>'), 'Line')<cr>

" ------------------------------------------------------------------------------

" Syntastic
Plugin 'scrooloose/syntastic'

let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="✗"
let g:syntastic_style_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_warning_symbol="⚠"
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore="E501,E126,E127,E128,W291"'
let g:syntastic_javascript_checkers=['jshint']

nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>e :lopen<cr>
nnoremap <leader>E :lclose<cr>

" ------------------------------------------------------------------------------

" Python Mode
Plugin 'klen/python-mode'

let g:pymode_run=0
let g:pymode_lint=0
let g:pymode_folding=0
let g:pymode_virtualenv=0
let g:pymode_breakpoint=0
" Dont use linter, we use synstastic for that
let g:pymode_lint_on_write=0
let g:pymode_lint_signs=0
" Rope settings
let g:pymode_rope=1
let g:pymode_rope_autoimport_modules=['os', 're', 'shutil', 'datetime']
let g:pymode_rope_goto_definition_cmd='vnew'

" ------------------------------------------------------------------------------

" TMUX Line
Plugin 'edkolev/tmuxline.vim'

let g:tmuxline_preset={
  \'a': '#S',
  \'win': ['#I', '#W'],
  \'cwin': ['#I', '#W', '#F'],
  \'y': ['%R', '%a', '%d %b'],
  \'z': '#h'
  \ }

" ------------------------------------------------------------------------------

" Tagbar
Plugin 'majutsushi/tagbar'

let g:tagbar_width=30
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_indent=1

nnoremap <silent> <F10> :TagbarToggle<cr>

" ------------------------------------------------------------------------------

" Neocomplcache
Plugin 'Shougo/neocomplcache.vim'

let g:neocomplcache_max_list=15
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_ignore_case=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_enable_fuzzy_completion=1
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_fuzzy_completion_start_length=1
let g:neocomplcache_auto_completion_start_length=1
let g:neocomplcache_manual_completion_start_length=1
let g:neocomplcache_min_keyword_length=1
let g:neocomplcache_min_syntax_length=1
" Complete with words from any opened file
let g:neocomplcache_same_filetype_lists={}
let g:neocomplcache_same_filetype_lists._='_'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ------------------------------------------------------------------------------

" Others
" Vim Surround
Plugin 'tpope/vim-surround'
" NERD Commenter
Plugin 'scrooloose/nerdcommenter'

" ------------------------------------------------------------------------------

" Color Schemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'

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
"colorscheme badwolf
colorscheme molokai

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
"let &colorcolumn="80,".join(range(120,999), ",")
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
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
" When scrolling keep cursor 3 lines away from screen border
set scrolloff=3
" Open splits below and right by default
set splitbelow
set splitright

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
nnoremap <s-up> gUiw
inoremap <s-up> <esc>gUiw:i
vnoremap <s-up> <esc>iwU
nnoremap <s-down> guiw
inoremap <s-down> <esc>guiw:i
vnoremap <s-down> <esc>iwu

" Copy/Paste from/to OS's Clipboard
nnoremap <leader>yo "*y
vnoremap <leader>yo "*y
nnoremap <leader>po "*p

" Normal Mode - Specifics
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
nnoremap tm :tabmove<cr>

" Splits
" Navigation
nnoremap <leader>hh <c-w>h
nnoremap <leader>jj <c-w>j
nnoremap <leader>kk <c-w>k
nnoremap <leader>ll <c-w>l
" Move current split to a new tab
nnoremap <leader>tt <c-w>T
" Rotate
nnoremap <leader>> <c-w>r
nnoremap <leader>< <c-w>R

" Insert Mode - Specifics
" Exit Insert Mode
inoremap jk <esc>

" Quick Pairs
inoremap <leader>' ''<esc>i
inoremap <leader>" " <esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i
inoremap <leader>{ {}<esc>i

" ------------------------------------------------------------------------------

" Abbreviations
iabbrev vdg@ vdraceil@gmail.com
iabbrev vdy@ vdraceil@gmail.com
