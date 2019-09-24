call plug#begin('~/.local/share/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

" set termguicolors
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

set fillchars+=vert:\

map <Leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fuzzy finding with fzf
nnoremap <C-p> :<C-u>FZF<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" code completion with deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

" linting with ale
let g:ale_linters = {
      \ 'python': ['flake8']
      \}

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
hi AleErrorSign ctermbg=NONE ctermfg=red
hi AleWarningSign ctermbg=NONE ctermfg=yellow

nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:ale_python_flake8_executable = expand('~/.pyenv/versions/neovim3/bin/flake8')
let g:ale_python_flake8_use_global = 1

" setting the python executable
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" golang settings
let g:go_auto_type_info = 1
au FileType go nmap <F12> <Plug>(go-def-split)
