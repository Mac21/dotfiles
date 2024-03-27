local vim = vim
local Plug = vim.fn['plug#']
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " vim-polyglot configurations
-- " Must be called before vim-polyglot init
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.g.polyglot_disabled = ['go']

vim.call('plug#begin')

-- " Start Vim - Completion / FS plugins.
-- "Plug 'vim-syntastic/syntastic'
Plug('scrooloose/nerdtree')
Plug('scrooloose/nerdcommenter')
Plug('shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
Plug('shougo/denite.nvim')
Plug('davidhalter/jedi')
Plug('deoplete-plugins/deoplete-jedi')
Plug('google/vim-searchindex')
-- " End Vim - Completion / FS plugins.

-- " Start Vim - C++ plugins.
-- "Plug 'zchee/deoplete-clang', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
-- "Plug 'shougo/neoinclude.vim', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
-- Plug 'neomake/neomake', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
-- " End Vim - C++ plugins.

-- " Start Vim - Go plugins.
-- " Stable vim-go before 1.14 or so
-- " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.19' }
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries', ['tag'] = 'v1.28' })
-- " Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
-- " End Vim - Go plugins.


-- " Start Vim - Syntax
-- Plug 'sheerun/vim-polyglot'
-- " End Vim - Syntax

-- " Start Vim - HTML plugins.
Plug('alvan/vim-closetag')
Plug('othree/html5.vim')
-- " End Vim - HTML plugins.

-- " Start Vim - Actionscript plugins.
-- " Plug 'jeroenbourgois/vim-actionscript', { 'for': [ 'mxml', 'actionscript'] }
-- " End Vim - Actionscript plugins.

-- " Start Vim - Javascript plugins.
Plug('carlitux/deoplete-ternjs', { ['do'] = 'npm install -g tern' })
Plug('othree/jspc.vim')
-- " End Vim - Javascript plugins.

-- " Start Vim - Docker plugins.
-- "Plug 'zchee/deoplete-docker',
-- " End Vim - Docker plugins.

-- " Start Vim - Python plugins.
Plug('python-mode/python-mode', { ['for'] = 'python', ['branch'] = 'develop' })
-- " End Vim - Python plugins.

-- " Start Vim - Syntax Highlighting plugins.
Plug('chrisbra/Colorizer')
-- " End Vim - Syntax Highlighting plugins.

-- " Start Vim - git plugins.
Plug('tpope/vim-fugitive')
Plug('tpope/vim-git')
Plug('airblade/vim-gitgutter')
-- " End Vim - git plugins.

-- " Start Vim - Vim builtin wrappers plugins.
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
-- " End Vim - Vim builtin wrappers plugins.

-- " Start Vim - Vim interface plugins.
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('xolox/vim-misc')
-- " End Vim - Vim interface plugins.

vim.call("plug#end")


-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " Python setings
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.g.python_host_prog = '/home/toller/.pyenv/versions/neovim2/bin/python'
vim.g.python3_host_prog = '/home/toller/.pyenv/versions/neovim3/bin/python'

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " Editing setings
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

-- " Filetypes and encoding
vim.o.fileformats = 'unix,dos,mac'
vim.o.encoding = 'utf-8'
vim.o.wildignore = '.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.ropeproject'

-- " General behaviour
vim.opt.colorcolumn = 160 -- " Display colored column at N characters.
vim.opt.updatecount = 0  -- " Disable swap files.
vim.opt.timeoutlen = 2000

-- " Change path to the current buffers directory
-- "autocmd BufEnter * silent! lcd %:p:h
vim.opt.noml = true           --" No mode lines CVE-2002-1377, CVE-2016-1248, CVE-2019
vim.opt.ai = true             --" Autoident
vim.opt.si = true             --" Smartident
vim.opt.cindent = true        --" C indent
vim.opt.nowrap = true         --" Do not wrap lines
vim.opt.ignorecase = true     --" ... or ignore casing
vim.opt.hlsearch = true       --" Highlight matches
vim.opt.incsearch = true      --" Modern (wrapping) search
vim.opt.history = 500    --" Long undo history
vim.opt.tw = 1000        --" Text width.
vim.opt.viminfo = '20\,'1000 --" Increases the size of the .viminfo file, thus increasing global buffer size.
vim.opt.clipboard:append = { 'unnamedplus' }

-- " make backspace a more flexible
vim.opt.backspace = indent,eol,start

-- " Disable sounds
vim.opt.vb = ''
vim.opt.t_vb = ''
vim.opt.noerrorbells = true

-- " Tabbing, Default to 2 spaces as tabs
vim.opt.cino = :0g0(0,W2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- " Persistent undo
vim.opt.undodir = '~/.undodir/'
vim.opt.undofile = true

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " User interface setings
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.cmd.colorscheme('space-vim-dark')
vim.o.background = 'dark'                  -- " Dark background variation of theme

-- " Autocompletion
vim.opt.completeopt:remove = { 'preview' }

vim.opt.showmatch = true                        -- " Show matching braces when over one
vim.opt.number = true                           -- " Always show line-numbers
vim.opt.numberwidth = 1                    -- " Line-number margin width
vim.opt.mousehide = true                        -- " Do not show mouse while typing
vim.opt.mouse = n
vim.opt.guioptions:remove = { 'T' }                    -- " TODO
vim.opt.guioptions:append = { 'C' }                    -- "
vim.opt.linespace = 0                      -- " Don't insert any extra pixel lines
vim.opt.wildmenu = true                         -- " Wild menu
vim.o.wildmode = 'longest,list,full'       -- " Wild menu options

-- " Show < or > when characters are not displayed on the left or right.
-- " Also show tabs and trailing spaces.
vim.o.listchars = 'nbsp:¬,tab:>-,trail:.,precedes:<,extends:>'

-- " Highlight trailing whitespaces (+ keybindings below)
-- au InsertEnter * match SpellLocal /\s\+\%#\@<!$/
-- au InsertLeave * match SpellLocal /\s\+$/
-- au BufNewFile,BufRead *.mak,*.mako set filetype=mako
-- au BufNewFile,BufRead *.sls set filetype=yaml
-- au BufNewFile,BufRead *.h set filetype=c
-- au BufNewFile,BufRead *.hpp set filetype=cpp
-- au BufNewFile,BufRead *.kxi set filetype=java


-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " nerdcommenter config
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.g.NERDSpaceDelims = 1

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " Plugin configurations
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " Deoplete
-- source $HOME/.vim/deoplete.vim

-- " Key Maps
require('marlin')

-- " NERDTree
-- source $HOME/.vim/nerdtree.vim

-- " Pythonmode
-- source $HOME/.vim/pymode.vim

-- " Air-line
-- source $HOME/.vim/airline.vim

-- " Neomake
-- source $HOME/.vim/neomake.vim

-- " Javascript
-- source $HOME/.vim/javascript.vim

-- " Hexediting support
-- source $HOME/.vim/hexedit.vim

-- " Denite
-- source $HOME/.vim/denite.vim

-- " Actionscript
-- source $HOME/.vim/actionscript.vim

-- " Golang
-- source $HOME/.vim/golang.vim
