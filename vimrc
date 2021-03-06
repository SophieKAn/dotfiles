" Vundle Preamble {{{
set nocompatible        " required by vundle
filetype off            " required by vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}

" Vundle Plugins {{{

" required by Vundle
Plugin 'VundleVim/Vundle.vim'

" colorschemes
Plugin 'morhetz/gruvbox'

" rust plugin
Plugin 'rust-lang/rust.vim'

" racket plugin
Plugin 'wlangstroth/vim-racket'

" c++ plugin
Plugin 'octol/vim-cpp-enhanced-highlight'

" black plugin
Plugin 'psf/black'

" toml syntax highlighting
Plugin 'cespare/vim-toml'

" }}}

" Vundle Postamble {{{
" ALL plugins must be added before this line
call vundle#end()           " required by vundle
filetype plugin indent on   " required by vundle
" }}}

" Install vim-plug if not found {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" vim-plug section {{{
call plug#begin('~/.vim/plugged')
call plug#end()
" }}}

" Misc {{{
set encoding=utf-8
" }}}

" Spaces & Tabs {{{
set tabstop=4      " number of visual spaces per tab
set softtabstop=4  " number of spaces in tab when editing
set shiftwidth=4   " number of spaces used in indenting
set expandtab      " tabs are spaces
" }}}

" UI & Layout {{{
set number
set cc=88
set nowrap
set lazyredraw
" }}}

" Search {{{
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set showmatch   " highlight matching [{()}]
" }}}

" Colors {{{
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = "soft"
" }}}

" Key Mappings {{{

" re-map Esc
inoremap kk <Esc>
inoremap <Esc> <nop>

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" shift movement keys in normal mode
nnoremap h <nop>
nnoremap j <Left>
nnoremap k <Down>
nnoremap l <Up>
nnoremap ; <Right>

" shift movement keys in visual mode
vnoremap h <nop>
vnoremap j <Left>
vnoremap k <Down>
vnoremap l <Up>
vnoremap ; <Right>

" }}}
