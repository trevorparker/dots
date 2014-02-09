"""""""""""""
" .vimrc
"""""""""""""

set nocompatible
set bs=2

set autoindent
set autoread
set background=dark
set clipboard+=unnamed
set cursorline
set expandtab
set history=300
set hlsearch
set incsearch
set laststatus=2
set number
set pastetoggle=<F2>
set shiftwidth=4
set softtabstop=4
set smartindent
set tabstop=4
set wrap

set ttymouse=xterm2
set mouse=n

syntax enable

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

filetype plugin indent on     " required!

