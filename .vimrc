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
set showmode
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


" == Indentation Options ==
set shiftwidth=4
set softtabstop=4 softtabstop=4
set expandtab
set colorcolumn=80
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

" == Plugins through Vundle == {{{
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
Plugin 'vimwiki/vimwiki'

call vundle#end()

filetype plugin indent on
" }}}

" == Coc Settings == {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" == Colorscheme == {{{
colorscheme dracula
" }}}
 
" == Vimwiki Settings == {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}

