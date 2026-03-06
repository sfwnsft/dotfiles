# Setup

## Vim configuration ```~/.vimrc```

```
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

let g:polyglot_disabled = ['markdown']

call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'kaarmu/typst.vim'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

let g:startify_custom_header = []
let g:startify_lists = [{ 'type': 'files', 'header': ['   Recent Files'] }]
let g:startify_enable_special = 0

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25

let g:indentLine_char = '│'

nnoremap <silent> <C-p> :Files<CR>

nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>

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

```

## Terminal Inside Vim

- Terminal on the left side as a pane - :vert term
- Terminal on the right side as a pane - :vert rightbel term
- Terminal on the top as a pane - :term
- Terminal on the bottom as a pane - :bel term
- Split a pane - :vsplit

## Essential Plugins

These can be installed, updated, and removed inside Vim using,
:PlugInstall, :PlugUpdate, and :PlugClean.

- catppuccin/vim
- preservim/nerdtree
- iamcco/markdown-preview.nvim
- junegunn/fzf
- junegunn/fzf.vim
- tpope/vim-fugitive
- vim-airline/vim-airline
- vim-airline/vim-airline-themes
- sheerun/vim-polyglot
- kaarmu/typst.vim
- jiangmiao/auto-pairs
- tpope/vim-commentary
- Yggdroot/indentLine
- mhinz/vim-startify
- ap/vim-css-color
- sbdchd/neoformat
- tiagofumo/vim-nerdtree-syntax-highlight
- ryanoasis/vim-devicons

## Debugger Access

- Python: python -m pdb script.py
- JavaScript/Node: node inspect script.js
- C/C++ (compile first with -g):
  - clang -g program.c -o program
  - lldb ./program  
    or,
  - gcc -g program.c -o program
  - gdb ./program
- Java: jdb ClassName
- Go: dlv debug
- Rust: rust-gdb ./target/debug/program
- Ruby: ruby -r debug script.rb
- PHP: php -dxdebug.mode=debug script.php

## Common Commands in Most Debuggers

- n (Next line - step over)
- s (Step into function)
- c (Continue execution)
- b (Set breakpoint)
- p (Print variable)
- q (Quit)

## NERDTree & Pane Switching in Vim

- Ctrl+n (Toggle file tree)
- Enter (Open file)
- m (Menu - create/delete/rename)
- I (Toggle hidden files)
- ? (Toggle help)
- Ctrl+w w (Go back to NERDTree)
- Ctrl+w r (Swap panes)

## Fzf

- Ctrl+p (Find files)
- :Rg (Search text in files)
- Esc (Close fzf)
- Enter (Open file)

## Fugitive

- :Git status (View git status)
- :Git add % (Stage current file)
- :Git add . (Stage all files)
- :Git commit -m (Commit - type message, then :wq)
- :Git push (Push to remote)
- :Git pull (Pull from remote)
- :Git diff (View changes)
- :Git blame (See who changed lines)
- :Git log (View commit history)

## Markdown Preview

- :MarkdownPreview (Opens the .md file in a browser for preview)

## Vim-commentary

- :gcc (Comment the line in normal mode)
- :gc (Comment the line in visual mode)

## Neoformat

- :Neoformat (Code formatting)

## Zsh Shell ```~/.zshrc```

```
DISABLE_AUTO_TITLE="true"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

```

## Bash Shell ```~/.bashrc```

```
# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH='/Users/safwan/.oh-my-bash'

OSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".

OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source "$OSH"/oh-my-bash.sh

```
