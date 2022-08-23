if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'Shougo/ddc.vim'
  Plug 'vim-denops/denops.vim'
  Plug 'Shougo/pum.vim'
  Plug 'vim-jp/syntax-vim-ex'
  Plug 'vim-airline/vim-airline'
  Plug 'sheerun/vim-polyglot'
  Plug 'rakr/vim-one'
  Plug 'flazz/vim-colorschemes'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'takac/vim-hardtime'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'w0rp/ale'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'lambdalisue/suda.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

set termguicolors
set list listchars=tab:»\ ,trail:·

syntax on
colorscheme argonaut
set background=dark
set encoding=UTF-8
" Line numbers
set number
set relativenumber
" Plugin settings here.

let g:airline_theme='onedark'

let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

" Nerdtree conf
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tab for pum
inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

" Switch buffer
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" LEADER
let mapleader="\<SPACE>"

noremap <Leader>n  :NERDTreeToggle<CR>
noremap <Leader>d  :vs<CR>
noremap <Leader>D  :sp<CR>

" ALE
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
