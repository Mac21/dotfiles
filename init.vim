call plug#begin()
source $HOME/.vim/plugins.vim
call plug#end()

let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog='/home/toller/neovim2/bin/python'
let g:python3_host_prog='/home/toller/neovim3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing setings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetypes and encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.ropeproject

" General behaviour
set colorcolumn=160 " Display colored column at N characters.
set updatecount=0  " Disable swap files.
set timeoutlen=2000

" Change path to the current buffers directory
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
au BufNewFile,BufRead *.mak,*.mako set filetype=mako
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.h set filetype=c
au BufNewFile,BufRead *.hpp set filetype=cpp
au BufNewFile,BufRead *.kxi set filetype=java

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
source $HOME/.vim/deoplete.vim

" Key Maps
source $HOME/.vim/keymaps.vim

" NERDTree
source $HOME/.vim/nerdtree.vim

" Undotree
noremap <F10> :UndotreeToggle<CR>

" Tagbar
" noremap <F9> :TagbarToggle<CR>

" Pythonmode
source $HOME/.vim/pymode.vim

" Deoplete Clang(C++)
source $HOME/.vim/deoplete-clang.vim

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
