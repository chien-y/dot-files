call plug#begin()
Plug 'ycm-core/YouCompleteMe'

""""""""""Auto pairs""""""""""
Plug 'jiangmiao/auto-pairs'
"""""""""" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""""""" Jedi-Vim""""""""""
"Plug 'davidhalter/jedi-vim'

Plug 'ervandew/supertab'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"""""""""Color Scheme"""""""""
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'

Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
 
Plug 'yggdroot/indentline'

""""""""""Formater""""""""""
Plug 'chiel92/vim-autoformat'

"""""""""" Special characters """""""""
Plug 'arthurxavierx/vim-unicoder'

"""""""""""""
"""""""""Syntax Checking"""""""""
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'nvie/vim-flake8'

""""""""""Comment""""""""""""""""""""
Plug 'chrisbra/vim-commentary'

"""""""""" tmux  """"""""""
Plug 'christoomey/vim-tmux-navigator'

"""Run Python in cells"""""
Plug 'jpalardy/vim-slime', { 'for': 'python'  }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python'  }

""""Snippet""""
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set cursorline "Color the cursor line
let python_highlight_all=1
syntax on
filetype plugin indent on

" turn relative line numbers on
set relativenumber
set number
set number relativenumber

"""""""PEP8""""""""
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

"""tmux color issue"""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


set termguicolors
set background=dark
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_disable_italic_comment = 0

"""""""""""""""some key mapping"""""""""""""""
"Change the key for leaving insert mode
nnoremap <buffer> <F6> <Esc>:w<cr>:vert ter python "%"<cr>
nnoremap <buffer> <F5> <Esc>: !python "%"<cr>
inoremap jk <ESC>

" nnoremap <Space> <Nop>
let mapleader = "\<Space>"
set ttimeoutlen=150
set timeoutlen=150
   
nnoremap <buffer> <leader>w :w<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"key maps only one window
nnoremap <buffer> <leader>o <C-W><C-O>
nnoremap <buffer> <leader>q <C-W><C-q>

" vim-autoformat
noremap <F3> <Esc>:Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme key map
let g:ycm_key_list_select_completion   = ['<TAB>','<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <buffer> <leader>k :YcmCompleter GetDoc<CR>

let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-j>" 
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:python3_host_prog = '/home/chien/anaconda3/bin/python3'

" Disable signature help

" Disable Jedi-vim autocompletion and enable call-signatures options
" let g:jedi#auto_initialization = 0
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command = ""
" let g:jedi#show_call_signatures = "1"

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_python_checkers = ['flake8']

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1


"------------------------------------------------------------------------------
"" slime configuration 
"------------------------------------------------------------------------------
"" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" " always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
             \ 'socket_name': get(split($TMUX, ','), 0),
             \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
"
"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
"Use '# #' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'
let g:ipython_cell_tag = '# #'

"  Keyboard mappings. <Leader> is \ (backslash) by default

"" map <Leader>r to run script
autocmd FileType python nnoremap <buffer> <Leader>r <Esc>:w<cr>:IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
autocmd FileType python nnoremap <buffer> <Leader>R :IPythonCellRunTime<CR>
"
"" map <Leader>c to execute the current cell
autocmd FileType python nnoremap <buffer> <Leader>c <Esc>:w<cr>:IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
autocmd FileType python nnoremap <buffer> <Leader>C :IPythonCellExecuteCellJump<CR>
"
"" map <Leader>l to clear IPython screen
autocmd FileType python nnoremap <buffer> <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
autocmd FileType python nnoremap <buffer> <Leader>x :IPythonCellClose<CR>
"
"" map [c and ]c to jump to the previous and next cell header
autocmd FileType python nnoremap <buffer> [c :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap <buffer> ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
autocmd FileType python nnoremap <buffer> <Leader>h <Plug>SlimeLineSend
autocmd FileType python xnoremap <buffer> <Leader>h <Plug>SlimeRegionSend
