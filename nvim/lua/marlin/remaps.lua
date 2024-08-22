vim.g.mapleader = ","

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { expr = false })

vim.keymap.set('n', '<Tab>', ':tabnext<CR>') -- nnoremap <Tab> :tabnext<CR>
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>') -- nnoremap <S-Tab> :tabprevious<CR>

-- " For highlighting trailing whitespaces
vim.keymap.set('n', '<Leader>wn', ':match SpellLocal /^\\s* \\s*\\<Bar>\\s\\+$/<CR>') -- nnoremap <Leader>wn :match SpellLocal /^\s* \s*\<Bar>\s\+$/<CR>
vim.keymap.set('n', '<Leader>wf', ':match<CR>') -- nnoremap <Leader>wf :match<CR>
-- Set line endings to unix
vim.keymap.set('n', '<Leader>lu', ':set ff=unix<CR>')

vim.keymap.set('n', '<leader>fg', vim.cmd.Git)
vim.keymap.set('n', '<leader>fw', vim.cmd.Gw)
vim.keymap.set('n', '<leader>fb', ':Git blame<CR>')
vim.keymap.set('n', '<leader>fc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>fp', ':Git push<CR>')
vim.keymap.set('n', '<leader>fr', ':Git pull --rebase<CR>')
