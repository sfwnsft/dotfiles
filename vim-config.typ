#set document(title: "Safwan's Vim Config", author: "Safwan")

#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern")
#show math.equation: set text(font: "New Computer Modern")

#set page(
  paper: "a4",
  header: align(center)[12.02.2026],
  footer: context align(center)[#counter(page).display()],
)

#set par(justify: true)
#set heading(numbering: "1.")

#show title: set text(size: 16pt)
#show title: set align(center)

#title[Safwan's Vim Configuration]

#align(center)[
  #link("https://github.com/sfwnsft")[GitHub] |
  #link("https://linkedin.com/in/sfwnsft")[LinkedIn] |
  #link("mailto:safwansafatinfo@gmail.com")[E-mail]
]

= Setup Guide

== This is the content inside ``` ~/.vimrc ```

``` syntax on

filetype plugin indent on

set number
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set clipboard=unnamed
set mouse=a
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

call plug#end()

nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <Leader>b :Buffers<CR>

let g:airline_theme='catppuccin_mocha'
let g:airline_powerline_fonts = 1

let g:catppuccin_flavour = 'mocha'
colorscheme catppuccin_mocha ```

#pagebreak()

== The plugins that I use

These can be installed, updated, and removed inside Vim using, \
:PlugInstall, :PlugUpdate, and :PlugClean.

- vim-polyglot
- fzf
- vim-fugitive
- vim-airline
- vim-airline-themes
- catppuccin (mocha)
- nerdtree
- fzf.vim
- typst.vim

== Commands for Workflow

=== Terminal Inside Vim

- :terminal or, :term (Open terminal inside Vim)
- :below terminal or, :bel term (Open terminal inside Vim below)

=== Debugger Access

Python: python -m pdb script.py \
JavaScript/Node: node inspect script.js \

C/C++ (compile first with -g): \
  clang -g program.c -o program
  lldb ./program \
  or, \
  gcc -g program.c -o program
  gdb ./program \

Java: jdb ClassName \
Go: dlv debug \
Rust: rust-gdb ./target/debug/program \
Ruby: ruby -r debug script.rb \
PHP: php -dxdebug.mode=debug script.php

=== Common Commands (Work in most debuggers)

  n       (Next line - step over) \
  s       (Step into function) \
  c       (Continue execution) \
  b       (Set breakpoint) \
  p       (Print variable) \
  q       (Quit)

#pagebreak()

=== NERDTREE PLUGIN

- Ctrl+n          (Toggle file tree) \
- Enter           (Open file) \
- m               (Menu - create/delete/rename) \
- I               (Toggle hidden files) \
- ?               (Toggle help) \
- Ctrl+w w        (Go back to NERDTree)

=== FZF PLUGIN

- Ctrl+p          (Find files) \
- Ctrl+f          (Search text in files) \
- Esc             (Close fzf) \
- Enter           (Open file)

=== FUGITIVE PLUGIN

- :Git status     (View git status) \
- :Git add %      (Stage current file) \
- :Git add .      (Stage all files) \
- :Git commit -m  (Commit - type message, then :wq) \
- :Git push       (Push to remote) \
- :Git pull       (Pull from remote) \
- :Git diff       (View changes) \
- :Git blame      (See who changed lines) \
- :Git log        (View commit history)

That's pretty much it for now I guess.

