local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Start Vim - Completion / FS plugins.
Plug('scrooloose/nerdtree')
Plug('scrooloose/nerdcommenter')
-- Plug('shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
Plug('shougo/denite.nvim')
-- Plug('davidhalter/jedi')
-- Plug('deoplete-plugins/deoplete-jedi')
Plug('google/vim-searchindex')
-- End Vim - Completion / FS plugins.

-- Start Vim - C++ plugins.
-- Plug 'neomake/neomake', { 'for': ['c++', 'c', 'cpp', 'h', 'hpp', 'hxx']}
-- End Vim - C++ plugins.

-- Start Vim - Go plugins.
    -- Stable vim-go before 1.14 or so
-- Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries', ['tag'] = 'v1.28' })
-- End Vim - Go plugins.

-- Start Vim - HTML plugins.
Plug('alvan/vim-closetag')
-- Plug('othree/html5.vim')
-- End Vim - HTML plugins.

-- Start Vim - Javascript plugins.
-- Plug('carlitux/deoplete-ternjs', { ['do'] = 'npm install -g tern' })
-- Plug('othree/jspc.vim')
-- End Vim - Javascript plugins.

-- Start Vim - Python plugins.
-- Plug('python-mode/python-mode', { ['for'] = 'python', ['branch'] = 'develop' })
-- End Vim - Python plugins.

-- Start Vim - Syntax Highlighting plugins.
Plug('chrisbra/Colorizer')
-- End Vim - Syntax Highlighting plugins.

-- Start Vim - git plugins.
Plug('tpope/vim-fugitive')
Plug('tpope/vim-git')
Plug('airblade/vim-gitgutter')
-- End Vim - git plugins.

-- Start Vim - Vim builtin wrappers plugins.
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
-- End Vim - Vim builtin wrappers plugins.

-- Start Vim - Vim interface plugins.
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
-- Plug('xolox/vim-misc')
-- End Vim - Vim interface plugins.
--

-- Start VIM - NVIM lsp and cmp plugins
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- For vsnip users.
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
-- End VIM - NVIM lsp and cmp plugins

-- Start VIM - LSP Server management plugin
Plug('williamboman/mason.nvim')
-- End VIM - LSP Server management plugin

-- Start VIM - LSP Server management plugin
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- End VIM - LSP Server management plugin

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
vim.o.colorcolumn = 160 -- " Display colored column at N characters.
vim.o.updatecount = 0  -- " Disable swap files.
vim.o.timeoutlen = 2000

-- " Change path to the current buffers directory
-- "autocmd BufEnter * silent! lcd %:p:h
vim.o.ml = false           --" No mode lines CVE-2002-1377, CVE-2016-1248, CVE-2019
vim.o.ai = true             --" Autoident
vim.o.si = true             --" Smartident
vim.o.cindent = true        --" C indent
vim.o.wrap = false         --" Do not wrap lines
vim.o.ignorecase = true     --" ... or ignore casing
vim.o.hlsearch = true       --" Highlight matches
vim.o.incsearch = true      --" Modern (wrapping) search
vim.o.history = 500    --" Long undo history
vim.o.tw = 1000        --" Text width.
vim.opt.clipboard:append { 'unnamedplus' }

-- " make backspace a more flexible
vim.o.backspace = 'indent,eol,start'

-- " Tabbing, Default to 2 spaces as tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- " Persistent undo
vim.o.undodir = '/home/toller/.undodir/'
vim.o.undofile = true

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- " User interface setings
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.cmd.colorscheme('space-vim-dark')
vim.o.background = 'dark'                  -- " Dark background variation of theme

-- " Autocompletion
vim.opt.completeopt:remove { 'preview' }

vim.o.showmatch = true                        -- " Show matching braces when over one
vim.o.number = true                           -- " Always show line-numbers
vim.o.numberwidth = 1                    -- " Line-number margin width
vim.o.mousehide = true                        -- " Do not show mouse while typing
vim.o.mouse = 'n'
vim.o.linespace = 0                      -- " Don't insert any extra pixel lines
vim.o.wildmenu = true                         -- " Wild menu
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
