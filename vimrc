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

set ts=4 sw=4 st=4 noet

set autoindent
set smartindent

set hlsearch
set incsearch

set ignorecase
set smartcase

"reopen a file
if has("autocmd")
	au BufreadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif
	au BufWritePost .vimrc source $MYVIMRC
	au FileType ruby,javascript setlocal ts=2 sts=2 sw=2 et
	au FileType python,ruby setlocal st=2 sw=2 ts=2 et
	au FileType c,cpp :set cindent
endif

let mapleader = ","

if has("unix")
	noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
else
	noremap <leader>e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

map #i ^I#include <$a> 
map! #i ^I#include <$a> 
nmap <f7> :make<CR>

set autoread
set cursorline

"=====ycm for rust=====
""语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
""开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_tag_files = 1
"let g:ycm_goto_buffer_command='horizontal-split'    " horizontal split the window when 'goto' another location
"let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
"set completeopt=menu,menuone                        " disable the function definition preview window
"let g:ycm_add_preview_to_completeopt=0              " (need to work with above
let g:ycm_key_invoke_completion='<C-x>'             " Set the key binding which invoke syntax completion
"" Automatically invoke the syntax completion when 2 letters typed
let g:ycm_semantic_triggers={'c,cpp,python,rust,go,perl,ruby,lua,javascript':['re!\w{2}']}
let g:ycm_rust_src_path = '/home/jicui/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src'

""让vim的补全菜单行为与一般IDE一致 
"set completeopt=longest,menu
""离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""回车即选中当前项
"inoremap <expr> <CR>    pumvisible()?"\<C-y>":"<CR>"
""上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
""
""youcompleteme默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
""
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
""从第2个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=2
""禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"let g:ycm_confirm_extra_conf=0
""在接受补全后不分裂出一个窗口显示接受项
"set completeopt-=preview
""force recomile with syntastic
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
""
""注释输入也补全
"let g:ycm_complete_in_comments = 1
""字符串输入也补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也被吸收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"
""设置error和warning的提示符，如果没有设置，ycm会以syntastic的g:syntastic_warning_symbol
""和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"======go setting=======
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 0
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

"=====nerdtree====
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$','\.ko$', '\.so$', '\.a$', '\.swp$', '\.bak$', '\~$']
let NERDTreeMininalUI=1
let NERDTreeQuitOnOpen=1
"设置宽度
"let NERDTreeWinSize=25

"=====tagbar======
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"=====edit macros=====
"imap{ {}<ESC>i<CR><ESC>O
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ‘ ’‘<ESC>i
inoremap " ""<ESC>i
inoremap ` ``<ESC>i
" cscope
nmap <leader><Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader><Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader><Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader><Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>
