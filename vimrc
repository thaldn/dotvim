if has("syntax")
	syntax enable
endif
set nocompatible
set encoding=utf-8

set ts=4
set sw=4
set st=4

set autoindent
set smartindent

set hlsearch
set incsearch

set ignorecase
set smartcase

"detect file type
filetype on
filetype plugin on

"reopen a file
if has("autocmd")
	au BufreadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
	filetype plugin indent on
endif

if has("unix")
	map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
	map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

au FileType c,cpp :set cindent
map #i ^I#include <$a> 
map! #i ^I#include <$a> 

set autoread
set cursorline
