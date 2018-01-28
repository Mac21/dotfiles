setlocal tabstop=4 softtabstop=4 shiftwidth=4
setlocal nolist"

" Deoplete Go
let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache=0
" The completion cache feature was removed.
" au Filetype go let g:deoplete#sources#go#json_directory='/home/toller/.cache/deoplete/go/$GOOS_$GOARCH'
let g:deoplete#sources#go#json_directory=''

" Vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_functionl=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go mappings
" Go run
nmap <leader>r <Plug>(go-run)
nmap <leader>rt <Plug>(go-run-tab)
nmap <Leader>rs <Plug>(go-run-split)
nmap <Leader>rv <Plug>(go-run-vertical)

" Go build
nmap <leader>b <Plug>(go-build)

" Go test
nmap <leader>t <Plug>(go-test)

" Go coverage
nmap <leader>c <Plug>(go-coverage)

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
