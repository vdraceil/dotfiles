filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/syntastic'

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'shawncplus/skittles_berry'
Plugin 'sjl/badwolf'

call vundle#end()

filetype plugin indent on
