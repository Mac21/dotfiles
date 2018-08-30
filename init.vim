call plug#begin()
" Start Vim - Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'shougo/neosnippet.vim'
"Plug 'shougo/neosnippet-snippets'
" End Vim - Snippets

" Start Vim - Syntax
Plug 'sheerun/vim-polyglot'
" End Vim - Syntax

" Start Vim - Writing
" Distraction free
Plug 'junegunn/goyo.vim', { 'for' : 'writing' }
Plug 'dbmrq/vim-ditto', { 'for' : 'writing' }
Plug 'ron89/thesaurus_query.vim', { 'for' : 'writing' }
Plug 'reedes/vim-wordy', { 'for' : 'writing' }
Plug 'reedes/vim-pencil', { 'for' : 'writing' }
" Grammar
"Plug 'reedes/vim-lexical', { 'for' : 'writing' }
Plug 'rhysd/vim-grammarous', { 'for' : 'writing' }
" Support for curly quotes
Plug 'reedes/vim-textobj-quote', { 'for' : 'writing' }
Plug 'kana/vim-textobj-user', { 'for' : 'writing' }
"Plug 'dpelle/vim-LanguageTool', { 'for' : 'writing' }
" End Vim - Writing

" Start Vim - Completion / FS plugins.
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/denite.nvim'
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'google/vim-searchindex'
" End Vim - Completion / FS plugins.

" Start Vim - C++ plugins.
Plug 'zchee/deoplete-clang', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
Plug 'shougo/neoinclude.vim', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
Plug 'neomake/neomake', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx', 'go', 'golang']}
" End Vim - C++ plugins.

" Start Vim - Go plugins.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
" End Vim - Go plugins.

" Start Vim - HTML plugins.
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
" End Vim - HTML plugins.

" Start Vim - Actionscript plugins.
Plug 'jeroenbourgois/vim-actionscript'
" End Vim - Actionscript plugins.

" Start Vim - Javascript plugins.
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/jspc.vim'
" End Vim - Javascript plugins.

" Start Vim - Docker plugins.
"Plug 'zchee/deoplete-docker',
" End Vim - Docker plugins.

" Start Vim - Dlang plugins.
Plug 'landaire/deoplete-d', { 'for': 'd' }
" End Vim - Dlang plugins.

" Start Vim - Python plugins.
Plug 'python-mode/python-mode', { 'branch': 'develop' }
" End Vim - Python plugins.

" Start Vim - Ruby plugins.
"Plug 'tpope/vim-rails',
"Plug 'vim-ruby/vim-ruby',
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'rb'] }
" End Vim - Ruby plugins.

" Start Vim - Syntax Highlighting plugins.
"Plug 'tpope/vim-markdown'
"Plug 'tmux-plugins/vim-tmux',
Plug 'chrisbra/Colorizer'
" End Vim - Syntax Highlighting plugins.

" Start Vim - git plugins.
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
" End Vim - git plugins.

" Start Vim - Vim builtin wrappers plugins.
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" End Vim - Vim builtin wrappers plugins.

" Start Vim - Vim interface plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
" End Vim - Vim interface plugins.

" Start Vim - saltstack plugins.
Plug 'saltstack/salt-vim', { 'for': 'sls' }
" End Vim - saltstack plugins.
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
" Plugin configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
source $HOME/.vim/deoplete.vim

" Key Maps
source $HOME/.vim/keymaps.vim

" NERDTree
source $HOME/.vim/nerdtree.vim

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

" Golang
source $HOME/.vim/golang.vim
