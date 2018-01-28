let g:pymode=1
let g:pymode_python='python3'
let g:pymode_options=1
let g:pymode_rope=1
" Remove folding for defs and multi line docstrings.
"let g:pymode_lint=0
"let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8']
let g:pymode_folding=0
let g:pymode_virtualenv=1
let g:pymode_rope_lookup_project=1
let g:pymode_rope_complete_on_dot=0
"let g:pymode_rope_project_root='~/.config/.ropeproject/'
"let g:pymode_rope_project_root='~/.config'

" So pymode doesn't compute fold for every window.
augroup unset_folding_in_insert_mode
    autocmd!
    autocmd InsertEnter *.py setlocal foldmethod=marker
    autocmd InsertLeave *.py setlocal foldmethod=expr
augroup END
