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
Plug 'majutsushi/tagbar'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/denite.nvim'
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'google/vim-searchindex'
" End Vim - Completion / FS plugins.

" Start Vim - C++ plugins.
Plug 'zchee/deoplete-clang'
Plug 'shougo/neoinclude.vim'
Plug 'neomake/neomake'
" End Vim - C++ plugins.

" Start Vim - Go plugins.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go'
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
Plug 'landaire/deoplete-d'
" End Vim - Dlang plugins.

" Start Vim - Python plugins.
Plug 'python-mode/python-mode', { 'branch': 'develop' }
" End Vim - Python plugins.

" Start Vim - Ruby plugins.
"Plug 'tpope/vim-rails',
"Plug 'vim-ruby/vim-ruby',
Plug 'fishbullet/deoplete-ruby'
" End Vim - Ruby plugins.

" Start Vim - Syntax Highlighting plugins.
Plug 'tpope/vim-markdown'
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
Plug 'mbbill/undotree'
" End Vim - Vim builtin wrappers plugins.

" Start Vim - Vim interface plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
" End Vim - Vim interface plugins.

" Start Vim - saltstack plugins.
Plug 'saltstack/salt-vim'
" End Vim - saltstack plugins.
