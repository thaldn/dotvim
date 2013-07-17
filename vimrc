if has("syntax")
	syntax enable
	syntax on
endif
set nocompatible
set encoding=utf-8

set ts=4
set sw=4
set st=4
set autoindent
set cindent

set hlsearch
set incsearch

"detect file type
filetype on
filetype plugin on

"reopen a file
if has("autocmd")
	au BufreadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
	filetype plugin indent on
endif

map #i ^I#include <$a> 
map! #i ^I#include <$a> 
