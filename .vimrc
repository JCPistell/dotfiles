set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Easymotion'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

syntax on
set number
set encoding=utf-8
set laststatus=2
set nowrap
set magic

colorscheme Tomorrow-Night 

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <Leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

