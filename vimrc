syntax on

colorscheme desert256

set nocp

set number

set relativenumber

set cursorline

set linebreak

set showbreak=++

set showmatch

set hlsearch

set incsearch

set autoindent

set expandtab

set shiftwidth=4

set smartindent

set smarttab

set ruler

set autochdir

set backspace=indent,eol,start

" Antlr syntax
au BufRead,BufNewFile *.g  set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

