" .vimrc

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" basic things
set shortmess+=I                " disable startup screen
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
set tabstop=4
set softtabstop=4
set shiftwidth=4

" display
set background=dark
set number
set laststatus=2
set wrap

" search
set hlsearch
set incsearch

" mouse
set ttymouse=xterm2
set mouse=a

" statusline
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi statusline guifg=#ffffff  guibg=#094afe
set statusline=
set statusline+=\[%n]                                  "buffernr
set statusline+=\ %<%F\                                "File+path
set statusline+=\ %y\                                  "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=\ col:%03c\                            "Colnr
set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

set dir=$HOME/.vim/swap//,~/tmp//,/var/tmp//,/tmp//,.
set backupdir=$HOME/.vim/backup//,~/tmp//,/var/tmp//,/tmp//,.
set undodir=$HOME/.vim/undo//,~/tmp//,/var/tmp//,/tmp//,.

if exists('+fixeol')
  set nofixeol
endif

let g:go_disable_autoinstall = 1
let g:go_fmt_command = "gofmt"

let g:ledger_align_at=80

syntax enable

filetype plugin indent on       " infer from ~/.vim/ftplugin/

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd VimEnter,WinEnter * match ExtraWhitespace /\s\+$/

autocmd BufRead,BufNewFile *.md set filetype=markdown

