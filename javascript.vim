let g:used_javascript_libs='vue,underscore,jquery,handlebars'

let g:deoplete#sources#ternjs#tern_bin='/home/toller/.node_modules/bin/tern'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#filter=0
let g:deoplete#sources#ternjs#include_keywords=1
let g:deoplete#sources#ternjs#expand_word_forward=0
let g:deoplete#sources#ternjs#in_literal=0
let g:deoplete#sources#ternjs#filetypes=[
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ 'js',
      \ 'javascript',
      \ 'typescript'
      \ ]

" Make tabs 4 spaces to conform with our js,ts, and vue template standards
au Filetype vue,typescript set tabstop=2 softtabstop=2 shiftwidth=2
au Filetype vue,typescript call deoplete#custom#option({
\ 'auto_complete_delay': 10,
\ 'auto_complete': v:false,
\ 'num_processes': 4,
\ })
