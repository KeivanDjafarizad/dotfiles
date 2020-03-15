"        _                 _       _    __ _ _           
" __   _(_)_ __ ___     __| | ___ | |_ / _(_) | ___  ___ 
" \ \ / / | '_ ` _ \   / _` |/ _ \| __| |_| | |/ _ \/ __|
"  \ V /| | | | | | | | (_| | (_) | |_|  _| | |  __/\__ \
"   \_/ |_|_| |_| |_|  \__,_|\___/ \__|_| |_|_|\___||___/
" 
" Author: Keivan Djafarizad
" Description: A mostly copied vim dotfiles, needs to be properly commented,
" but still...
" URL: https://github.com/KeivanDjafarizad/dotfiles
"
" == Features ==
set nocompatible
filetype indent plugin on
syntax on

" == Must Have Options ==
set hidden
set wildmenu
set showcmd
set hlsearch " Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)

" == Usablitity Options ==
set showmatch
set background=dark
set showmode
set clipboard=unnamed           
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set relativenumber
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

" == Indentation Options ==
set shiftwidth=4
set softtabstop=4
set expandtab

" == Mappings ==
map Y y$ " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
nnoremap <C-L> :nohl<CR><C-L> " Map <C-L> (redraw screen) to also turn off search highlighting until the next search

source ~/.vim/plugins.vim
                                                       
