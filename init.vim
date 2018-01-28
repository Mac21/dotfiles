" For Pathogen plugin manager
call pathogen#infect()
call pathogen#helptags()

let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog='/home/toller/neovim2/bin/python'
let g:python3_host_prog='/home/toller/neovim3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugin
filetype plugin on
filetype indent on

" Filetypes and encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.ropeproject

" General behaviour
set colorcolumn=160 " Display colored column at N characters.
set updatecount=0  " Disable swap files.

"autocmd BufEnter * silent! lcd %:p:h
set ai             " Autoident
set si             " Smartident
set cindent        " C indent
set nowrap         " Do not wrap lines
set ignorecase     " ... or ignore casing
set hlsearch       " Highlight matches
set incsearch      " Modern (wrapping) search
set history=500    " Long undo history
set tw=1000        " Text width.
set viminfo='20\,'1000 " Increases the size of the .viminfo file, thus increasing global buffer size.
set clipboard+=unnamedplus

" make backspace a more flexible
set backspace=indent,eol,start

" Disable sounds
set vb t_vb="
set noerrorbells

" Tabbing, Default to 2 spaces as tabs
set cino=:0g0(0,W2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Persistent undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme space-vim-dark
set background=dark                  " Dark background variation of theme

" Autocompletion
set completeopt-=preview
"set completeopt+=longest,menuone,noinsert,noselect

set showmatch                        " Show matching braces when over one
set number                           " Always show line-numbers
set numberwidth=1                    " Line-number margin width
set mousehide                        " Do not show mouse while typing
set mouse=n
set guioptions-=T                    " TODO
set guioptions+=C                    "
set linespace=0                      " Don't insert any extra pixel lines
set wildmenu                         " Wild menu
set wildmode=longest,list,full       " Wild menu options

" Show < or > when characters are not displayed on the left or right.
" Also show tabs and trailing spaces.
set list listchars=nbsp:¬,tab:>-,trail:.,precedes:<,extends:>

" Highlight trailing whitespaces (+ keybindings below)
au InsertEnter * match SpellLocal /\s\+\%#\@<!$/
au InsertLeave * match SpellLocal /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/keymaps.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
source $HOME/.vim/deoplete.vim

" ViM highlighting
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.h set filetype=c
au BufNewFile,BufRead *.hpp set filetype=cpp

" NERDTree
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_startup=1
let g:nerdtree_tabs_smart_startup_focus=2
noremap <F12> :NERDTree<CR>

" Undotree
noremap <F10> :UndotreeToggle<CR>

" Tagbar
" noremap <F9> :TagbarToggle<CR>

" Pythonmode
let g:pymode=1
let g:pymode_python='python3'
let g:pymode_options=1
let g:pymode_rope=1
" Remove folding for defs and multi line docstrings.
"let g:pymode_lint=0
"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8']
let g:pymode_folding=0
let g:pymode_virtualenv=1
let g:pymode_rope_lookup_project=1
let g:pymode_rope_complete_on_dot=0
"let g:pymode_rope_project_root='~/.config/.ropeproject/'
"let g:pymode_rope_project_root='~/.config'

" So pymode doesn't compute fold for every window.
augroup unset_folding_in_insert_mode
    autocmd!
    autocmd InsertEnter *.py setlocal foldmethod=marker
    autocmd InsertLeave *.py setlocal foldmethod=expr
augroup END

" Deoplete Clang(C++)
" Include path for ubuntu
" let g:deoplete#sources#clang#libclang_path="/usr/lib/x86_64-linux-gnu/libclang-4.0.so.1"
" Include path for arch
let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/include/clang"

" Syntastic
source $HOME/.vim/syntastic.vim

" Air-line
source $HOME/.vim/airline.vim

" Neomake
source $HOME/.vim/neomake.vim

" Javascript
source $HOME/.vim/javascript.vim

" Hexediting support
source $HOME/.vim/hexedit.vim

" Denite
source $HOME/.vim/denite.vim

" Actionscript
source $HOME/.vim/actionscript.vim

" Unite
"source $HOME/.vim/unite.vim

" Golang
source $HOME/.vim/golang.vim
