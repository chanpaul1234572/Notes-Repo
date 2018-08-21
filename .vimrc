set backspace=2
syntax enable
set number
set cursorline
set autoindent
set smartindent
set ruler
set nocompatible
set mouse=a
filetype off
set tabstop=4

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

set laststatus=2
set background=dark
colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='wombat'
let g:solarized_termcolors=256
let g:gruvbox_contrast_dark = 'hard'
