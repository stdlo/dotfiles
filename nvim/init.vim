" defaults
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set number
set nobackup
set noswapfile
set wildmenu
set mouse=a
if &compatible
  set nocompatible
endif

" mark anything past 80 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

" tab v spaces config https://stackoverflow.com/a/234578/4863857
filetype plugin indent on
set tabstop=4
set shiftwidth=2
set expandtab

runtime lib/remaps.vim
runtime lib/plugins.vim

" Post plugin syntax enable
syntax on
set termguicolors
colorscheme ayu
