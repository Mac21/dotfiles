let g:closetag_filenames="*.html,*.mako,*.mak,*.phtml,*.xhtml,*.xml,*.jsx,*.vue"

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
au Filetype vue,typescript set tabstop=4 softtabstop=4 shiftwidth=4
