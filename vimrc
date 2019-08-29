set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'jeetsukumaran/vim-indentwise'

call vundle#end()

filetype on
filetype indent on
filetype plugin indent on
filetype plugin on

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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
let g:SuperTabDefaultCompletionType = "context"
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoTo<CR>

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path']

let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <Leader>f :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

