set nocompatible              " be iMproved, required
filetype off                  " required

" ======== Vundle Setup =========
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'elzr/vim-json'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mattn/emmet-vim'

call vundle#end()         
filetype plugin indent on
" ===============================
syntax on
set bg=dark

set ts=4
set sw=4
set sts=4
set expandtab

autocmd Filetype xml setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

map fj <Esc>
map! fj <Esc>
