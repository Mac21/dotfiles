"nnoremap <C-p> :Unite buffer file_rec/async:! file/new<CR>
let g:unite_source_grep_command = 'rg'

call unite#custom#source('file,file_rec,file/new,file_rec/async,file_mru,buffer', 'ignore_globs',
\ split(&wildignore, ','))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file,file/new,file_mru,buffer,file_rec',
\ 'matchers', 'matcher_fuzzy')

call unite#custom#profile('default', 'context', {
\   'start_insert': 0,
\   'winheight': 10,
\   'direction': 'botright',
\ })
