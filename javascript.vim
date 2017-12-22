let g:used_javascript_libs='vue,underscore,jquery,handlebars'

let g:tern#command=['tern']
let g:tern#arguements=['--persistent']

let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#filetypes=[
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ '...'
      \ ]
