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
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

" General behaviour
set colorcolumn=160 " Display colored column at 120 characters.
set updatecount=0  " Disable swap files.

set autochdir      " CWD is always same as current file
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

" Persistent undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Filetype specific
"au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
au Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4
au Filetype go setlocal nolist

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface setings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme space-vim-dark
set background=dark                  " Dark background variation of theme

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
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ViM highlighting
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.h set filetype=c
au BufNewFile,BufRead *.hpp set filetype=c++

" NERDTree
let NERDTreeShowHidden=1
noremap <F12> :NERDTree<CR>

" Undotree
noremap <F10> :UndotreeToggle<CR>

" Tagbar
noremap <F9> :TagbarToggle<CR>

" Pythonmode
" let g:pymode_python='python3'

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#disable_auto_complete=0
let g:deoplete#auto_complete_delay=10

" Neomake
source $HOME/.vim/neomake.vim

" Hexediting support
source $HOME/.vim/hexedit.vim

" Deoplete Clang(C++)
" Include path for ubuntu
" let g:deoplete#sources#clang#libclang_path="/usr/lib/x86_64-linux-gnu/libclang-4.0.so.1"
" Include path for arch
let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/include/clang"

" Deoplete Go
au Filetype go let g:deoplete#sources#go#gocode_binary='/home/toller/gocode/bin/gocode'
au Filetype go let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
au Filetype go let g:deoplete#sources#go#use_cache=0
" The completion cache feature was removed.
" au Filetype go let g:deoplete#sources#go#json_directory='/home/toller/.cache/deoplete/go/$GOOS_$GOARCH'
au Filetype go let g:deoplete#sources#go#json_directory=''

" Vim-go
au Filetype go let g:go_highlight_functionl=1
au Filetype go let g:go_highlight_methods=1
au Filetype go let g:go_highlight_fields=1
au Filetype go let g:go_highlight_types=1
au Filetype go let g:go_highlight_operators=1
au Filetype go let g:go_highlight_build_constraints=1
au Filetype go let g:go_fmt_command = "goimports"
au Filetype go let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
au Filetype go let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1
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

" CloseTag
" autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source /home/toller/.vim/bundle/vim-closetag/plugin/closetag.vim
" autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

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

tnoremap <expr> <Esc> "\<C-\>\<C-n>"
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

" For highlighting trailing whitespaces
nnoremap <Leader>wn :match SpellLocal /^\s* \s*\<Bar>\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

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

if bufwinnr(1)
  map <kPlus>  <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif
