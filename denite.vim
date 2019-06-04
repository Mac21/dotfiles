nnoremap <silent> <C-f> :Denite -mode=insert buffer file/rec<CR>
nnoremap <silent> <C-p> :Denite grep<CR>

call denite#custom#option('default', 'empty', 0)

call denite#custom#var('file/rec', 'command', ['rg', '--files'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
\ [ '.git/', '.ropeproject/', '__pycache__/',
\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
\   'tests/', 'alembic/versions/', '*.wsdl', 'codemirror/'])
