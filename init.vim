" For Pathogen plugin manager
call pathogen#infect()
call pathogen#helptags()

let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog='/home/toller/neovim2/bin/python'
let g:python2_host_prog='/home/toller/neovim2/bin/python'
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
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" General behaviour
" set nobackup
" set nowritebackup
set colorcolumn=160 " Display colored column at 120 characters.
set updatecount=0  " Disable swap files.

set autochdir      " CWD is always same as current file
set ai             " Autoident
set si             " Smartident
set cindent        " C indent
set nowrap         " Do not wrap lines
set smartcase      " Smart casing when searching
set ignorecase     " ... or ignore casing
set hlsearch       " Highlight matches
set incsearch      " Modern (wrapping) search
set history=500    " Long undo history
set tw=1000        " Text width.
set viminfo='20\,'1000 " Increases the size of the .viminfo file, thus increasing global buffer size.

" make backspace a more flexible
set backspace=indent,eol,start

" Disable sounds
set vb t_vb="
set noerrorbells
set visualbell

" Tabbing, Default to 2 spaces as tabs
set cino=:0g0(0,W2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Filetype specific
"au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
au Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
"colorscheme solarized
"colorscheme desert
colorscheme space-vim-dark
"set t_Co=256

"set cursorline                       " Highlight the current line
set showmatch                        " Show matching braces when over one
set ruler                            " Always show current position
set number                           " Always show line-numbers
set numberwidth=1                    " Line-number margin width
set mousehide                        " Do not show mouse while typing
set mouse=n
set background=dark                  " Dark background variation of theme
"set guifont=Andale\ Mono\ 7.5        " Monospaced small font
set guioptions-=T                    " TODO
set guioptions+=C                    "
set linespace=0                      " Don't insert any extra pixel lines
set lazyredraw                       " Don't redraw while running macros
set wildmenu                         " Wild menu
set wildmode=longest,list,full       " Wild menu options

" Show < or > when characters are not displayed on the left or right.
" Also show tabs and trailing spaces.
set list listchars=nbsp:¬,tab:>-,trail:.,precedes:<,extends:>
au Filetype go setlocal nolist

" Autocompletion
set ofu=syntaxcomplete#Complete
set completeopt+=longest,menuone
set completeopt-=preview
highlight Pmenu guibg=brown gui=bold

" Statusline
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" Highlight trailing whitespaces (+ keybindings below)
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ViM highlighting
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

" Highlight errors for VIM supported languages
" Supported languages are: ada, c, chill, csc, forth, groovy, icon, java, lpc, mel, nqc, nroff, ora, pascal, plm, plsql, python and ruby. The c settings also apply to cpp.
let c_space_errors=1
let java_space_errors=1
let python_space_errors=1
let ruby_space_errors=1

" NERDTree
let NERDTreeShowHidden=1
noremap <F12> :NERDTree<CR>

" Tagbar
noremap <F8> :TagbarToggle<CR>

" Pythonmode
" let g:pymode_python='python3'

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#disable_auto_complete=1
let g:deoplete#auto_complete_delay=10

" Neomake
source ~/.confing/nvim/neomake.vim

" Deoplete Clang(C++)
let g:deoplete#sources#clang#libclang_path="/usr/lib/x86_64-linux-gnu/libclang-4.0.so.1"
let g:deoplete#sources#clang#clang_header="/usr/include/clang"

" Deoplete Go
au Filetype go let g:deoplete#sources#go#gocode_binary='/home/toller/go/bin'
au Filetype go let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
au Filetype go let g:deoplete#sources#go#use_cache=1
au Filetype go let g:deoplete#sources#go#json_directory='home/toller/.cache/deoplete/go/$GOOS_$GOARCH'

" Vim-go
au Filetype go let g:go_highlight_functionl=1
au Filetype go let g:go_highlight_methods=1
au Filetype go let g:go_highlight_fields=1
au Filetype go let g:go_highlight_types=1
au Filetype go let g:go_highlight_operators=1
au Filetype go let g:go_highlight_build_constraints=1
au Filetype go let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
au Filetype go let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages={"level": "warnings"}
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=[""]
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler_options='--std=c++14'
let g:syntastic_cpp_gcc_checker=1
let g:syntastic_c_check_header=1
let g:syntastic_c_compiler_options='--std=c11'
let g:syntastic_c_gcc_checker=1

" Air-line
let g:airline_powerline_fonts=1
let g:airline_theme='violet'
set noshowmode
set laststatus=2
set timeoutlen=1000
" set ambiwidth=double Note: This was causing spaces to appear in the airline status bar.
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

" CloseTag
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source /home/russt/.vim/bundle/vim-closetag/plugin/closetag.vim
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  map <LeftMouse> ""
endif

" Vim-go mappings
" Go run
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

" Go build
au FileType go nmap <leader>b <Plug>(go-build)

" Go test
au FileType go nmap <leader>t <Plug>(go-test)

" Go coverage
au FileType go nmap <leader>c <Plug>(go-coverage)

" Go def
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Go doc
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Go Misc
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" End Vim-go mappings

inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" Deoplete mappings
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent><expr> <CR>
      \ pumvisible() ? deoplete#close_popup() : <SID>my_cr_function()
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction"}}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" End Deoplete mappings

" RESIZE with numlock +-/*
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call HHome()<CR>
nnoremap <silent> <home> :call HHome()<CR>
function! HHome()
  let curcol = wincol()
  normal ^
  let newcol = wincol()
  if newcol == curcol
    normal 0
  endif
endfunction

"<end> goes to end of screen before end of line
imap <kend> <end>
nmap <kend> <end>
inoremap <silent> <end> <C-O>:call HEnd()<CR>
nnoremap <silent> <end> :call HEnd()<CR>
function! HEnd()
  let curcol = wincol()
  normal g$
  let newcol = wincol()
  if newcol == curcol
    normal $
  endif
  "http://www.pixelbeat.org/patches/vim-7.0023-eol.diff
  if virtcol(".") == virtcol("$") - 1
    normal $
  endif
endfunction

"Ctrl-{up,down} to scroll. (gvim)
if has("gui_running")
  nmap <C-up> <C-y>
  imap <C-up> <C-o><C-y>
  nmap <C-down> <C-e>
  imap <C-down> <C-o><C-e>
endif

if bufwinnr(1)
  map <kPlus>  <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif

" For highlighting trailing whitespaces
nnoremap <Leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

" space / shift-space scroll in normal mode
noremap <S-space> <C-b>
noremap <space> <C-f>
