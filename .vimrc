call plug#begin()
Plug 'ycm-core/YouCompleteMe'

""""""""""Auto pairs""""""""""
Plug 'jiangmiao/auto-pairs'
"""""""""" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""""""" Jedi-Vim""""""""""

Plug 'ervandew/supertab'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"""""""""Color Scheme"""""""""
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
 
Plug 'yggdroot/indentline'

""""""""""Formater""""""""""
Plug 'chiel92/vim-autoformat'

"""""""""Syntax Checking"""""""""
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

""""""""""Comment""""""""""""""""""""
Plug 'chrisbra/vim-commentary'

call plug#end()

set cursorline "Color the cursor line
let python_highlight_all=1
syntax on
filetype plugin indent on

set number
""""""""PEP8""""""""
set autoindent
set tabstop=4 "number of spaces when the Tab key is pressed
set softtabstop=4
set shiftwidth=4
set textwidth=79
set fileformat=unix
set encoding=utf-8

set splitbelow
set splitright

set incsearch "search as characters are entered
set ignorecase " ignore case when search
set smartcase "Do smart case match
set hlsearch "highlight matches
set backspace=indent,eol,start

colorscheme gruvbox
set background=dark

"""""""""""""""some key mapping"""""""""""""""
"Change the key for leaving insert mode
nnoremap <buffer> <F6> <Esc>:w<cr>:vert ter python3 "%"<cr>
nnoremap <buffer> <F5> <Esc>:w !python3 "%"<cr>
inoremap jk <ESC>

nnoremap <Space> <Nop>
let mapleader =" "
nnoremap <leader>w :w<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"key maps only one window
nnoremap <leader>o <C-W><C-O>

" vim-autoformat
noremap <F3> <Esc>:Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""


let g:python3_host_prog = '/home/chien/anaconda3/bin/python3'

" Disable signature help

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_python_checkers = ['flake8']

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1

