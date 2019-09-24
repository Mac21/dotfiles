autocmd FileType denite call s:denite_settings()

nnoremap <silent> <C-f> :Denite buffer file/rec<CR>
nnoremap <silent> <C-p> :Denite grep<CR>

function! s:denite_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

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
