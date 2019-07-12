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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'Valloric/YouCompleteMe'

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

" ==== general settings ====
let mapleader = "," " rebind <Leader> key
set autoread
set nobackup
set nowritebackup
set noswapfile

" ==== Plugin Configs ====
" = AIRLINE:
set laststatus=2
set guifont=Source\ Code\ Pro\ Medium\ 12
" = NERDTree
let NERDTreeWinPos='right'
noremap <Leader>k :NERDTreeToggle<cr>
noremap \nf :NERDTreeFind<cr>
map <F9> :NERDTree<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufWinEnter * NERDTreeMirror
let NERDTreeShowLineNumbers=1

" ==== Appearance ========

syntax on
set number
set cursorline
set nofoldenable

set expandtab " Make sure that every file uses spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set autoindent  " Copy indent from current line, over to the new line
set shiftwidth=2
set	tabstop=2

" Set the tab width
let s:tabwidth=2
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth
au Filetype * let &l:softtabstop = s:tabwidth

" colors and themes
set t_Co=256
set background=dark
colorscheme molokai

" this fixes background problems in putty
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight CursorLine ctermbg=NONE

" special files
au BufNewFile,BufRead *.ejs set filetype=jst

" ==== keyboard shortcuts ====
map <Leader>m :tabn<CR>
map <Leader>n :tabp<CR>
vmap <F7> :w !xclip -i -sel c<CR><CR>
nmap <F8> :r !xclip -o -sel -c<CR>
nnoremap " '| " remap 'jump to mark' to "
" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" ==== run current file and display output in new buffer ====
"nnoremap <C-h> :w<CR>:let g:file = expand("%:p")<CR>:new<CR>:execute "read !".g:file<CR><CR>:q!
"inoremap <C-h> <ESC>:w<CR>:let g:file = expand("%:p")<CR>:new<CR>:execute "read !".g:file<CR><CR>:q!

" ==== html and php key bindings ===
autocmd Filetype html,php nmap <F6> :w \| ! uml %<CR><CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" === include PC specific addons ===
so ~/.vimrc_perltidy.vim
