"#############################
"       ＿人人人人人＿
"       ＞  .vimrc  ＜
"       ￣Y^Y^Y^Y^Y^￣
"#############################


"=== 一般設定 ================
set nocompatible
set autoread
set hidden
set backup

set backupdir=~/.vim/backup
set noswapfile
set viminfo+=n~/.vim/.viminfo

set whichwrap=b,s,h,l,<,>,[,]
"=============================

"=== 表示設定 ================
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set nowrap
set title
set number
set showcmd
set hlsearch
set laststatus=2
set statusline=\ %<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ \ %l/%L\ "

highlight Normal ctermbg=232
highlight Visual ctermbg=239
highlight LineNr ctermbg=233 ctermfg=lightgray
highlight MatchParen ctermbg=239
highlight StatusLine term=bold cterm=bold ctermfg=233 ctermbg=lightgray

set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
set ambiwidth=double
if &encoding == 'utf-8'
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue
  match ZenkakuSpace /　/
endif
"=============================


"=== 編集設定 ================
set autoindent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set smarttab
set smartindent

" 保存時に行末の空白を削除
function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()
"=============================


"=== 入力設定 ================
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"=============================


"=== NeoBundle ===============
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

syntax on
filetype indent on
filetype plugin indent on
"=============================


"== Ruby =====================
compiler ruby
let ruby_space_errors = 1

" 補完
set infercase

let g:neocomplcache_enable_at_startup = 1

"let g:neocomplcache_force_overwrite_completefunc = 1
"let g:neocomplcache#sources#rsense#home_directory = expand('~/.bundle/rsense-0.3')
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_skip_auto_completion_time = '0.3'

"imap <expr><C-g> neocomplcache#undo_completion()
"imap <expr><CR> neocomplcache#smart_close_popup()
imap <silent><expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"============================


