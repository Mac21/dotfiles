-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
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
        vim.keymap.set('n', '<Leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
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

lsp.tsserver.setup {
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
