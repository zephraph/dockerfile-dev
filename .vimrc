set nocompatible              " be iMproved, required
filetype off                  " required

" ======== Vundle Setup =========
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()         
filetype plugin indent on
" ===============================

set ts=4
set sw=4
set sts=4
set expandtab

autocmd Filetype xml setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype coffeescript setlocal ts=2 sts=2 sw=2
