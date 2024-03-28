vim.api.nvim_create_autocmd('FileType', {
    pattern = 'denite',
    group = vim.api.nvim_create_augroup('denite_remaps', { clear = true }),
    callback = function(ev)
        denite_remaps(ev)
    end
})

vim.keymap.set('n', '<Leader>pf', ':Denite buffer file/rec<CR>')
vim.keymap.set('n', '<C-f>', ':Denite buffer file/rec<CR>')
vim.keymap.set('n', '<Leader>ps', ':Denite grep<CR>')

function denite_remaps(ev)
  local opts = {
    buffer = ev.buf,
    silent = true
  }
  vim.keymap.set('n', '<CR>', vim.fn['denite#do_map']('do_action'), opts) -- nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  vim.keymap.set('n', '<Tab>', vim.fn['denite#do_map']('choose_action'), opts) -- nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action')
  vim.keymap.set('n', 'd', vim.fn['denite#do_map']('do_action', 'delete'), opts) -- nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  vim.keymap.set('n', 'p', vim.fn['denite#do_map']('do_action', 'preview'), opts) -- nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  vim.keymap.set('n', 't', vim.fn['denite#do_map']('do_action', 'tabopen'), opts) -- nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tabopen')
  vim.keymap.set('n', 's', vim.fn['denite#do_map']('do_action', 'split'), opts) -- nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
  vim.keymap.set('n', 'v', vim.fn['denite#do_map']('do_action', 'vsplit'), opts) -- nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
  vim.keymap.set('n', 'q', vim.fn['denite#do_map']('quit'), opts) -- nnoremap <silent><buffer><expr> q denite#do_map('quit')
  vim.keymap.set('n', '<Esc>', vim.fn['denite#do_map']('quit'), opts) -- nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  vim.keymap.set('n', 'i', vim.fn['denite#do_map']('open_filter_buffer'), opts) -- nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  vim.keymap.set('n', '<Space>', vim.fn['denite#do_map']('toggle_select'), opts) -- nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
end

vim.fn['denite#custom#option']('default', 'empty', 0)
vim.fn['denite#custom#var']('file/rec', 'command', { 'rg', '--files' })

vim.fn['denite#custom#var']('grep', 'command', { 'rg' })
vim.fn['denite#custom#var']('grep', 'default_opts', { '--vimgrep', '--no-heading', '--smart-case' })
vim.fn['denite#custom#var']('grep', 'recursive_opts', {})
vim.fn['denite#custom#var']('grep', 'pattern_opt', { '--regexp' })
vim.fn['denite#custom#var']('grep', 'separator', { '--' })
vim.fn['denite#custom#var']('grep', 'final_opts', {})

-- Change ignore_globs
vim.fn['denite#custom#filter']('matcher/ignore_globs', 'ignore_globs', {'.git/', 'node_modules', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/', 'tests/', 'alembic/versions/', '*.wsdl', 'codemirror/'})
