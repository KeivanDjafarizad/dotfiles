set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

filetype plugin indent on
