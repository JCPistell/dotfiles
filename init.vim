call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'dense-analysis/ale'

call plug#end()

set nu

filetype indent on
filetype plugin indent on
filetype plugin on

syntax enable
set encoding=utf-8
set laststatus=2
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set magic

autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 textwidth=100
autocmd FileType markdown setlocal textwidth=120

let python_highlight_all=1

colorscheme zenburn

set hlsearch
hi Search ctermfg=DarkGrey
hi Search ctermbg=Cyan
hi MatchParen cterm=bold ctermfg=Cyan ctermbg=Grey
noremap <F4> :set hlsearch! hlsearch?<CR>

set backspace=indent,eol,start
set pastetoggle=<F3>

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

map <Leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
      \ 'python': ['flake8']
      \}

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

