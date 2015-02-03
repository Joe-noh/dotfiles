" ＿人人人人人＿
" ＞  .vimrc  ＜
" ￣Y^Y^Y^Y^Y^￣

set nocompatible
filetype plugin indent off

set autoread
set nobackup

set nowrap
set notitle
set number
set showcmd
set incsearch
set hlsearch
set hidden

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent

set backspace=indent,eol,start

set viminfo+=n~/.vim/.viminfo
set noswapfile

set whichwrap=b,s,h,l,<,>,[,]

set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
set ambiwidth=double
if &encoding == 'utf-8'
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue
  match ZenkakuSpace /　/
endif

set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-obsession.git'

NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'heartsentwined/vim-emblem'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'

call neobundle#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0  && !exists("s:std_in") | NERDTree | endif

colorscheme jellybeans
if &term =~ 'xterm-256color' || 'screen-256color'
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ 'xterm-color'
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

let g:indentLine_color_term = 16

let g:lightline = {
\  'colorscheme': 'jellybeans',
\  'active': {
\    'left': [
\      ['mode', 'paste'],
\      ['fugitive', 'readonly', 'filename', 'modified']
\    ]
\  },
\ 'component': {
\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\ },
\ 'component_visible_condition': {
\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
\ },
\}
set laststatus=2
syntax enable

" 保存時に行末の空白を削除
function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

filetype indent on
filetype plugin on
