local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports
    }
})
