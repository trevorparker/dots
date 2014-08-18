" .vimrc

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" basic things
set nocompatible                " make vim useful
set autoread
set backspace=2                 " indent,eol,start
set encoding=utf-8
set history=300

" indentation
set autoindent
set shiftwidth=4
set smartindent

" tabs
set expandtab
set softtabstop=4
set tabstop=4

" display
set background=dark
set cursorline
set number
set laststatus=2
set wrap

" search
set hlsearch
set incsearch

" mouse
set ttymouse=xterm2
set mouse=a

set dir=$HOME/.vim/swap//,~/tmp//,/var/tmp//,/tmp//,.

let g:detectindent_preferred_expandtab = 1
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "gofmt"

syntax enable

filetype plugin indent on       " infer from ~/.vim/ftplugin/

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd VimEnter,WinEnter * match ExtraWhitespace /\s\+$/

autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufReadPost * :DetectIndent

