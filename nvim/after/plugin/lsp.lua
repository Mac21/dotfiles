-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

local new_vert_term = function(bufp, args)
    local buf = vim.api.nvim_create_buf(false, true) + 1
    vim.cmd.terminal(args)
    vim.cmd("setlocal nonumber norelativenumber nobuflisted")
    vim.cmd("setlocal filetype=terminal")
    vim.api.nvim_buf_set_keymap(
        bufp,
        "n", "<C-T>", ":bw! " .. buf .. "<CR>",
        { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        buf,
        "n", "q", ":bw! " .. buf .. "<CR>",
        { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        buf,
        "t", "<C-T>", ":bw! " .. buf .. "<CR>",
        { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        buf,
        "n", "<C-T>", ":bw! " .. buf .. "<CR>",
        { noremap = true, silent = true }
    )
    vim.cmd.b(bufp)

    return buf
end

local run_cmd_in_vert_term = function(ev, args)
    local bufnr = new_vert_term(ev.buf, args)
    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.cmd('bo 10sview')
        vim.cmd.b(bufnr)
    end
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local filetype = vim.bo[ev.buf].filetype
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<Leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>ff', function()
            vim.lsp.buf.format()
            vim.cmd.write()
        end, opts)
        -- Only add build and run keymaps if we're in a go file
        if filetype == "cpp" then
            vim.keymap.set('n', '<Leader>gh', function()
                vim.cmd.ClangdSwitchSourceHeader()
            end, opts)
            vim.keymap.set('n', '<Leader>mp', function()
                vim.cmd("!cmake --build ./build")
            end, opts)
        end
        if filetype == "go" then
            vim.keymap.set('n', '<Leader>rt', function()
                run_cmd_in_vert_term(ev, 'go test .')
            end, opts)
            vim.keymap.set('n', '<Leader>rb', function()
                run_cmd_in_vert_term(ev, 'go build .')
            end, opts)
        end
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

-- Setup lspconfig.
local lsp = require('lspconfig')

-- setup languages
-- GoLang
lsp.gopls.setup {
    cmd = { 'gopls' },
    -- on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules", "-.ropeproject" },
        },
    },
    init_options = {
        usePlaceholders = true,
    }
}

lsp.pylsp.setup {
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 180
                }
            }
        }
    }
}

lsp.lua_ls.setup {
    capabilities = capabilities,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

lsp.ts_ls.setup {
    capabilities = capabilities,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue", "typescriptreact", },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript.jsx",
        "javascriptreact",
        "vue",
    },
}

lsp.eslint.setup({
    --on_attach = function(client, bufnr)
    --    vim.api.nvim_create_autocmd("BufWritePre", {
    --        buffer = bufnr,
    --        command = "EslintFixAll",
    --    })
    --end,
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = false,
        mode = "all"
      },
      experimental = {
        useFlatConfig = false
      },
      format = true,
      nodePath = "",
      onIgnoredFiles = "off",
      problems = {
        shortenToSingleLine = false
      },
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = {
        mode = "location"
      }
    }
})

lsp.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  capabilities = capabilities,
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})
