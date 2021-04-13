au Filetype go set tabstop=4 softtabstop=4 shiftwidth=4
au Filetype go set nolist

" Increase the max memory that can be used when highlighting
set mmp=5000

" Deoplete Go
let g:go_fmt_command = "goimports"
let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
let g:deoplete#sources#go#unimported_packages=1
let g:deoplete#sources#go#builtin_objects=1
let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 0
" The completion cache feature was removed.
let g:deoplete#sources#go#json_directory = ''

" Specifies the type of list to use for command outputs (such as errors from
" builds, results from static analysis commands, etc...). The list type for
" specific commands can be overridden with |'g:go_list_type_commands'|. The
" default value (empty) will use the appropriate kind of list for the command
" that was called. Supported values are "", "quickfix", and "locationlist".
let g:go_list_type = "locationlist"

" Vim-go
au BufRead /home/toller/gocode/src/github.com/mac21/*.go
      \  let s:tmp = matchlist(expand('%:p'),
          \ '/home/toller/gocode/src/\(github.com/mac21/[^/]\+\)')
      \| if len(s:tmp) > 1 |  exe 'silent :GoGuruScope ' . s:tmp[1] | endif
      \| unlet s:tmp
au BufRead /home/toller/gocode/src/code.veracitynetworks.com/development/broadhead/*.go
      \  let s:tmp = matchlist(expand('%:p'),
          \ '/home/toller/gocode/src/\(code.veracitynetworks.com/development/broadhead/[^/]\+\)')
      \| if len(s:tmp) > 1 |  exe 'silent :GoGuruScope ' . s:tmp[1] | endif
      \| unlet s:tmp


" Enable autocompelete for packages in std lib
let g:go_gocode_unimported_packages=1
" Enable tests to run in neovim term
let g:go_term_enabled=1
" Enable vet, golint, errcheck when GoMetaLinter is called manually
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck']
" Enable vet and golint when GoMetaLinter runs after save
let g:go_metalinter_autosave_enabled=['vet']
" Autorun GoMetaLinter on save
let g:go_metalinter_autosave=1
" Automatically highlight all matching variables on cursor over
let g:go_auto_sameids=0
" Use this option to show the type info (|:GoInfo|) for the word under the cursor automatically.
let g:go_auto_type_info=0

let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1

let g:syntastic_go_checkers=['golint', 'govet', 'errcheck']
let g:syntastic_go_gometalinter_args=['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go mappings
" Go run
nmap <leader>r <Plug>(go-run)
nmap <leader>rt <Plug>(go-run-tab)
nmap <Leader>rs <Plug>(go-run-split)
nmap <Leader>rv <Plug>(go-run-vertical)

" Go Alternate Edit
nmap <Leader>ea <Plug>(go-alternate-edit)

" Go build
nmap <leader>b <Plug>(go-build)

" Go test
nmap <leader>t <Plug>(go-test)

" Go coverage
nmap <leader>c <Plug>(go-coverage-toggle)

" Go def
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)

" Go doc
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>gb <Plug>(go-doc-browser)

" Go Misc
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)
" End Vim-go mappings
