if has("syntax")
	syntax enable
endif
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
""call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()

"detect file type
filetype on
filetype plugin indent on

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
nmap <f7> :make<CR>

set autoread
set cursorline
