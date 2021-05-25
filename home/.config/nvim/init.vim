" vim: foldmethod=marker

" First Of All {{{
set nocompatible
augroup filetype_vim
    autocmd!
    autocmd BufRead,BufNewFile *.vim setlocal foldmethod=marker
    autocmd BufRead,BufNewFile _vimrc setlocal foldmethod=marker
    autocmd BufRead,BufNewFile .vimrc setlocal foldmethod=marker
augroup END
" }}}

" vim-plug {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/The-NERD-tree'
Plug 'vim-scripts/pyflakes.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prim/pino.neovim'
Plug 'prim/foldtax.vim'


call plug#end()
" }}}

" Normal Config{{{
filetype on
filetype plugin on
filetype indent on

set number
set showcmd
set noshowmode
set nowrap

set encoding=utf-8
" set fileencodings=utf-8,chinese,latin-1  
" if has("win32")  
"     set fileencoding=chinese  
" else  
"     set fileencoding=utf-8  
" endif  
" set fileencoding=utf-8  
" language messages zh_CN.utf-8  

source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

set wildmode=list,longest
set wildignore=*.swp,*.pyc,*.bak,*.dmp

set backspace=indent,eol,start
set fillchars=vert:\ ,fold:\ 

set fileformat=unix
set fileformats=unix,dos

set clipboard+=unnamed
set shortmess+=I
set noerrorbells
set equalalways
set mouse=a

" help :syntax
" help :highlight

syntax on
set background=dark
let g:solarized_bold=0

colorscheme desert

set hlsearch
set incsearch
set smartcase
set ignorecase

set autoindent
set nosmartindent

set nobackup

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=t

" set guifont=Ubuntu_Mono:h9
" set guifont=Tsentsiu_Sans_Mono_HC:h9
set guifont=Sarasa_Term_SC:h10

set laststatus=4
set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-9(%4l,%02c-%03p%)

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

function! PrimaryFoldText()
    return substitute(getline(v:foldstart), "\t", "    ", "g")
endfunction

set foldtext=PrimaryFoldText()
set foldmethod=syntax
set foldlevelstart=0
" set foldnestmax=1
" set foldlevel=0

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set undofile
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set backup                        " enable backups
set swapfile                      " enable swaps
set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/tmp/backup " backups
set directory=$HOME/.vim/tmp/swap   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}

" Key Mapping {{{
" help key-notation
let mapleader=","

nnoremap <leader>v :edit ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>

nnoremap zz ZZ

nnoremap <C-t> :tabnew<Cr>
inoremap <C-t> <Esc>:tabnew<Cr>

nnoremap <space> za

nnoremap <C-E> ^i
inoremap <C-E> <Esc>^i

inoremap [ []<left>
inoremap { {}<left>
inoremap ' ''<left>
inoremap " ""<left>


if has("gui_running")
    nnoremap <M-1> 1gt
    nnoremap <M-2> 2gt
    nnoremap <M-3> 3gt
    nnoremap <M-4> 4gt

    inoremap <M-1> <Esc>1gt
    inoremap <M-2> <Esc>2gt
    inoremap <M-3> <Esc>3gt
    inoremap <M-4> <Esc>4gt

    nnoremap <M-k> <C-W>-
    nnoremap <M-j> <C-W>+
    nnoremap <M-h> <C-W><
    nnoremap <M-l> <C-W>>
else
    nnoremap <A-1> 1gt
    nnoremap <A-2> 2gt
    nnoremap <A-3> 3gt
    nnoremap <A-4> 4gt

    inoremap <A-1> <Esc>1gt
    inoremap <A-2> <Esc>2gt
    inoremap <A-3> <Esc>3gt
    inoremap <A-4> <Esc>4gt

    nnoremap <A-k> <C-W>-
    nnoremap <A-j> <C-W>+
    nnoremap <A-h> <C-W><
    nnoremap <A-l> <C-W>>
endif

" }}}

" Commnad Setup {{{
" }}}

" Scripts {{{
" help function-list
" get current file full path: expand("%p")
" }}}

" Lanuage Config {{{
" avoid buildin ftplugin change tabstop
let g:python_recommended_style=0
" }}}

" Plugin Config {{{

" vim-powerline {{{
set laststatus=2
let g:Powerline_symbols='unicode'
" }}}

" NerdTree {{{
let g:NERDTreeIgnore=["*.pyc",".orig"]
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeShowBookmarks=1

nnoremap <F1> <Esc>:NERDTreeToggle<CR>
" }}}

" CtrlP {{{
" nnoremap <F2> :CtrlP<CR>
" inoremap <F2> <Esc>:CtrlP<CR>
" }}}

" MiniBuffExpl {{{
" let g:miniBufExplSplitBelow=0
" }}}

" Tagbar {{{
" let g:tagbar_cats_bin="ctags"
" let g:tagbar_width=30
" let g:tagbar_autoshowtag=1
" let g:tagbar_left=1
" let g:tagbar_sort=0
" let g:tagbar_compact=1
" 
" nnoremap <F4> :TagbarToggle<CR>
" inoremap <F4> <Esc>:TagbarToggle<CR>a
" }}}

" PyFlakes {{{
" let g:pyflakes_use_quickfix=0
" }}}

" Cscope {{{
" execute "cscope add cscope.out"
" nnoremap <leader>gg :echo ":cscope find t " . expand("<cword>")<CR>
" nnoremap <leader>gd :echo ":cscope find g " . expand("<cword>")<CR>
let g:vim_markdown_folding_style_pythonic = 1
" }}}

" }}}

" Custom Setup {{{
let g:pino_server_ip = "127.0.0.1"
let g:pino_server_port = 10240""

" call asyncomplete#register_source({
"     \ 'name':'pino',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('pino#completor'),
"     \ })

" }}}
