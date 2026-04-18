# Setup

## Ghostty Terminal Configuration

```
theme = Ayu
background = #000000
font-size = 18

cursor-style = block
cursor-style-blink = false

shell-integration-features = no-cursor
macos-titlebar-proxy-icon = hidden

window-save-state = always
window-padding-balance = true

macos-titlebar-style = tabs
bell-features = no-system, no-audio, no-attention, no-title
```

## Tmux Configuration ```~/.tmux.conf```

```
set -g prefix C-a
unbind C-b
bind C-a send-prefix

set -g mouse on
set -g escape-time 0

set -g focus-events on
set -g set-clipboard on

bind | split-window -h -c "#{pane_current_path}"
bind _ split-window -v -c "#{pane_current_path}"
bind = select-layout even-horizontal

set -g default-terminal "tmux-256color"

set -g status-position top
set -g status-justify centre
set -g status-style "bg=default fg=#646B73"

set -g status-left ""
set -g status-right ""

setw -g window-status-format ' #T '
setw -g window-status-current-format ' #[bold]#T '

bind r source-file ~/.tmux.conf \; display "Config Reloaded!"
```

## Vim Configuration V1 ```~/.vimrc```

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
Plug 'Luxed/ayu-vim'
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

let g:indentLine_char = '│'

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25

nnoremap U <C-r>

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-r> :Rg<CR>

nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <C-f> :FloatermNew<CR>
tnoremap <silent> <C-f> <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> <C-_> :FloatermNext<CR>
tnoremap <silent> <C-_> <C-\><C-n>:FloatermNext<CR>

let g:airline_theme='ayu'
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l/%L | %c'

let g:airline_section_warning = ''
let g:airline_section_error = ''

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

set background=dark
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
```

## Minimal Version V2 (Best w/Tmux) ```~/.vimrc```

```
syntax on
filetype plugin indent on

set title
set titlestring=%t
set number
set cursorline
set autoread
set showmatch
set scrolloff=8
set autoindent
set noshowcmd
set tabstop=4
set shiftwidth=4
set splitright
set splitbelow
set noswapfile
set hidden
set incsearch
set wrap
set linebreak
set expandtab
set termguicolors
set clipboard=unnamed
set mouse=a
set fillchars=eob:\ 

let g:polyglot_disabled = ['markdown']

call plug#begin('~/.vim/plugged')
Plug 'Luxed/ayu-vim'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'kaarmu/typst.vim'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'
call plug#end()

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

let g:startify_custom_header = []
let g:startify_lists = [{ 'type': 'files', 'header': ['   Recent Files'] }]
let g:startify_enable_special = 0

let g:indentLine_char = '│'

let g:netrw_banner = 0
let g:netrw_winsize = 15
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

nnoremap U <C-r>

nnoremap <silent> <C-l> :ALELint<CR>
nnoremap <silent> <C-n> :Lexplore<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-r> :Rg<CR>

nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <C-f> :FloatermNew<CR>
tnoremap <silent> <C-f> <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> <C-_> :FloatermNext<CR>
tnoremap <silent> <C-_> <C-\><C-n>:FloatermNext<CR>

set background=dark
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
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
- Luxed/ayu-vim
- voldikss/vim-floaterm
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
- dense-analysis/ale

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

## NERDTree/Netrw & Pane Switching in Vim

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

## Essential Docker Commands

```docker run image_name``` - Creates and starts a new container from an image.

```docker ps``` - Lists your actively running containers.

```docker ps -a``` - Lists all containers.

```docker stop container_id``` - Stops a running container.

```docker start container_id``` - Restarts a container.

```docker rm container_id``` - Removes a stopped container.

```docker rm -f container_id``` - Force removes any container.

```docker pull image_name``` - Downloads an image from Docker Hub.

```docker build -t custom_name .``` - Builds a brand new image based on the ```Dockerfile``` in your current directory. 
The ```-t``` tags it with a readable name.

```docker images``` - Lists all the images.

```docker rmi image_id``` - Removes any image when no container is using it.

```docker system prune -a``` - Wipes all containers, unused networks, and dangling images.

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
