" For Pathogen plugin manager
" debug directory for including plugins for bug reproduction.
call pathogen#infect('debug/{}')
call pathogen#helptags()

let g:python_host_prog='/home/toller/neovim2/bin/python'
let g:python3_host_prog='/home/toller/neovim3/bin/python'
let g:deoplete#enable_at_startup=1

" Enable filetype plugin
filetype plugin indent on
syntax on
colorscheme space-vim-dark
set background=dark

set autochdir      " CWD is always same as current file

