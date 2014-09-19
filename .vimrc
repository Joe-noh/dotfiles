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
set notitle
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

set backspace=indent,eol,start

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


"=== pathogen ================
execute pathogen#infect()

syntax on
filetype plugin indent on
"=============================


"== Ruby =====================
compiler ruby
let ruby_space_errors = 1
"============================


