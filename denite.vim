nnoremap <silent> <C-f> :Denite -mode=insert buffer file/rec<CR>
nnoremap <silent> <C-p> :Denite grep<CR>

call denite#custom#option('default', 'empty', 0)
call denite#custom#option('default', 'mode', 'normal')

call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob=!.git', '--glob=!*.wsdl', '--glob=!codemirror/'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading', '--smart-case', '--glob=!docs/', '--glob=!tests/', '--glob=!alembic/versions/', '--glob=!*.wsdl', '--glob=!codemirror/'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
