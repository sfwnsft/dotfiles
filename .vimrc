syntax on
filetype plugin indent on

set number
set showmatch
set scrolloff=8
set autoindent
set noshowmode
set noshowcmd
set tabstop=4
set shiftwidth=4
set splitright
set splitbelow
set noswapfile
set wrap
set linebreak
set expandtab
set termguicolors
set clipboard=unnamed
set mouse=a
set fillchars=eob:\ 
autocmd InsertLeave * write

call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'kaarmu/typst.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:startify_custom_header = []
let g:startify_lists = [{ 'type': 'files', 'header': ['   Recent Files'] }]

nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25

let g:indentLine_char = '│'

nnoremap <C-p> :Files<CR>

let g:airline_theme='catppuccin_mocha'
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L | %c'

let g:airline_section_warning = ''
let g:airline_section_error = ''

let g:catppuccin_flavour = 'mocha'
colorscheme catppuccin_mocha

