vim.g.mapleader = ","

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { expr = true })

vim.keymap.set('n', '<Tab>', ':tabnext<CR>') -- nnoremap <Tab> :tabnext<CR>
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>') -- nnoremap <S-Tab> :tabprevious<CR>

-- " For highlighting trailing whitespaces
vim.keymap.set('n', '<Leader>wn', ':match SpellLocal /^\\s* \\s*\\<Bar>\\s\\+$/<CR>') -- nnoremap <Leader>wn :match SpellLocal /^\s* \s*\<Bar>\s\+$/<CR>
vim.keymap.set('n', '<Leader>wf', ':match<CR>') -- nnoremap <Leader>wf :match<CR>

vim.keymap.set('n', '<leader>fg', vim.cmd.Git)
vim.keymap.set('n', '<leader>fw', vim.cmd.Gw)
vim.keymap.set('n', '<leader>fc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>fp', ':Git push<CR>')
vim.keymap.set('n', '<leader>ff', ':Git pull --rebase<CR>')
