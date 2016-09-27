" Syntax highlighting
syntax on

" Colorscheme
colorscheme lucius

" Background
set background=dark

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Print lines number
set number

" Print number lines relative to current line
" current line is zero
set relativenumber

" Show line of cursor
set cursorline

" Display completion matches in a status line
set wildmenu

" Wrap long lines at a character rather than try to fit it on screen
set linebreak

" Show where the linebreak is
set showbreak=++

" Highlight where matching brackets are
set showmatch

" Highlight matches (:nohlsearch turns highlighting off)
set hlsearch

" Show matches as you type, enter goes to first match
set incsearch

" Copy indent from current line when starting a new line
set autoindent

" Use the appropriate number of spaces when typing 'tab'
set expandtab

" Number of spaces to use when indenting automatically
set shiftwidth=4

" Do smart autoindenting when starting a new line
set smartindent

" Tab behaves like tab (you can remove tabs)
set smarttab

" Show the line and col number of current position of the cursor
" set ruler
" When opening a file, go to its directory directly
set autochdir

" Customization of status line
set laststatus=2 " Always displaying the status line
set statusline=\[%-.60F\] " full file path, justified left, with mac 60 chars
set statusline+=\:\ %{&ff} "fileformat
set statusline+=%y    " file type
set statusline+=%=    " left / right separator
set statusline+=%c,\%l/%L "column, line / total_lines

" Antlr syntax highlighting
au BufRead,BufNewFile *.g  set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

