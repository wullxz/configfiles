set nocompatible              " be iMproved, required for Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==== Plugin Configs ====
" = AIRLINE:
set laststatus=2
set t_Co=256
set guifont=Source\ Code\ Pro\ Medium\ 12
" = NERDTree
let NERDTreeWinPos='right'
noremap <c-\> :NERDTreeToggle<cr>
noremap \nf :NERDTreeFind<cr>
map <F9> :NERDTree<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==== Appearance ========

syntax on
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set cursorline

set background=dark
colorscheme molokai

" ==== keyboard shortcuts ====
map <F8> :tabn<CR>
map <F7> :tabp<CR>
map @ :wincmd w<CR>
