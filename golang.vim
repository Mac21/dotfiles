au Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4
au Filetype go setlocal nolist"

" Deoplete Go
au Filetype go let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
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
