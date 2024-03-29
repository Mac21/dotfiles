vim.g.mapleader = ","

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { expr = true })

vim.keymap.set('n', '<Tab>', ':tabnext<CR>') -- nnoremap <Tab> :tabnext<CR>
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>') -- nnoremap <S-Tab> :tabprevious<CR>

-- " For highlighting trailing whitespaces
vim.keymap.set('n', '<Leader>wn', ':match SpellLocal /^\\s* \\s*\\<Bar>\\s\\+$/<CR>') -- nnoremap <Leader>wn :match SpellLocal /^\s* \s*\<Bar>\s\+$/<CR>
vim.keymap.set('n', '<Leader>wf', ':match<CR>') -- nnoremap <Leader>wf :match<CR>

vim.keymap.set('n', '<leader>fg', vim.cmd.Git)
vim.keymap.set('n', '<leader>fw', vim.cmd.Gw)
vim.keymap.set('n', '<leader>fp', ':Git push<CR>')

-- " Deoplete mappings
-- " <C-h>, <BS>: close popup and delete backword char.
-- vim.keymap.set('i', '<C-h>', function() 
--     return vim.call('deoplete#smart_close_popup')
-- end, { expr = true}) -- inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
-- vim.keymap.set('i', '<BS>', function()
--     return vim.call('deoplete#smart_close_popup')
-- end, { expr = true}) -- inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

-- " Use to make complete end0
-- "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
-- vim.keymap.set('i', '<CR>', function()
--     if vim.fn.pumvisible() == 1 then
--         return '<C-y>'
--     end
-- 
--     return '<CR>'
-- end, { expr = true})-- inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
-- -- inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
-- -- inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
-- -- inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
-- -- inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
-- 
-- 
-- -- " <CR>: close popup and save indent.
-- inoremap <silent><expr> <CR>
--       \ pumvisible() ? deoplete#close_popup() : <SID>my_cr_function()
-- function! s:my_cr_function() abort
--   return deoplete#close_popup() . "\<CR>"
-- endfunction"}}}
-- 
-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ deoplete#manual_complete()
-- function! s:check_back_space() abort "{{{
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~ '\s'
-- endfunction"}}}
-- 
-- inoremap <silent><expr> <S-TAB>
--       \ pumvisible() ? "\<C-p>" :
--       \ <SID>check_back_space() ? "\<S-TAB>" :
--       \ deoplete#manual_complete()
-- function! s:check_back_space() abort "{{{
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~ '\s'
-- endfunction"}}}
-- 
-- nnoremap <Leader>cp :Neomake!<CR>
