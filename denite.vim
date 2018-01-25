nnoremap <silent> <C-f> :Denite -mode=insert buffer file_rec<CR>
nnoremap <silent> <C-p> :Denite grep<CR>

call denite#custom#option('default', 'empty', 0)
call denite#custom#option('default', 'mode', 'normal')

call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
