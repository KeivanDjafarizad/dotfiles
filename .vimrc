"        _                 _       _    __ _ _           
" __   _(_)_ __ ___     __| | ___ | |_ / _(_) | ___  ___ 
" \ \ / / | '_ ` _ \   / _` |/ _ \| __| |_| | |/ _ \/ __|
"  \ V /| | | | | | | | (_| | (_) | |_|  _| | |  __/\__ \
"   \_/ |_|_| |_| |_|  \__,_|\___/ \__|_| |_|_|\___||___/
" 
" Author: Keivan Djafarizad
" Description: A mostly copied vim dotfiles, needs to be properly commented, but still...
" URL: https://github.com/KeivanDjafarizad/dotfiles
"
" == Basic Settings == {{{
" == Features ==
set nocompatible
filetype indent plugin on
syntax on

" == Must Have Options ==
set hidden
set wildmenu
set showcmd
set hlsearch " Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
set updatetime=300
"}}}

" == Usablitity Options == {{{
set showmatch
set background=dark
set noshowmode
set clipboard=unnamed           
set ignorecase
set smartcase
set backspace=indent,eol,start
set nowrap
set noswapfile
set nobackup
set nowritebackup
set cmdheight=2
set undodir=~/.vim/undodir
set undofile
set incsearch
set smartindent
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
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" == Indentation Options ==
set shiftwidth=4
set softtabstop=4 softtabstop=4
set expandtab
set colorcolumn=80
" }}}

" == Plugins through Vundle == {{{
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Bars
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'
" Vim enhancements
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'frazrepo/vim-rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lilydjwg/colorizer'
" Code enhancements
Plugin 'mattn/emmet-vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'dense-analysis/ale'
" Interesting Stuff
Plugin 'vimwiki/vimwiki'
" Colorschemes
Plugin 'franbach/miramare'
Plugin 'dracula/vim'

call vundle#end()

filetype plugin indent on
" }}}

" == Custom Mappings == {{{
let mapleader = " "
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$ 
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L> nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle <bar> :UndotreeFocus<CR>
nnoremap <leader>pv wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" }}}

" == Coc Settings == {{{
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" }}}

" == Colorscheme == {{{
set termguicolors
colorscheme miramare
" }}}
 
" == Lightline Configuration == {{{
let g:lightline = { 'colorscheme': 'wombat' }
"}}}
"
" == Vimwiki Settings == {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}

