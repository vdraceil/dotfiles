" General
" Navigation - Arrow keys are prohibited
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

" Normal Mode - Specifics
" Edit & Source .vimrc on the fly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:echom "$MYVIMRC Sourced Successfully!"<cr>

" Tab Navigation
nnoremap th :tabprev<cr>
nnoremap thh :tabfirst<cr>
nnoremap tl :tabnext<cr>
nnoremap tll :tablast<cr>
nnoremap tn :tabnew<cr>

" Insert Mode - Specifics
" Quick Pairs
inoremap <leader>' ''<esc>i
inoremap <leader>" " <esc>i
inoremap <leader>( ()<esc>i
inoremap <leader>[ []<esc>i

" Navigation
inoremap jk <esc>
inoremap <leader>0 <esc>I

" Plugins
" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>nb :Bookmark <cr>

" Easymotion
map / <Plug>(easymotion-sn)| " bi-directional find characters
omap / <Plug>(easymotion-tn)| " till before characters to the right
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)| " 2 char, bi-directional; press <cr> for 1 char match
nmap f <Plug>(easymotion-fl)| " 1 char, in line, forward
nmap F <Plug>(easymotion-Fl)| " 1 char, in line, backward
nmap <localleader>f <Plug>(easymotion-f)| " 1 char, forward
nmap <localleader>F <Plug>(easymotion-F)| " 1 char, backward
nmap <localleader>w <Plug>(easymotion-bd-wl)| " 1 char, in line, word start, bi-directional
nmap <localleader>e <Plug>(easymotion-bd-el)| " 1 char, in line, word end, bi-directional

" Unite
nnoremap <leader>f :<c-u>Unite -start-insert file_rec<cr>
