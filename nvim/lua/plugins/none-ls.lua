return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            source = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
            }
        })
        vim.keymap.set('n', "<C-A-l>", vim.lsp.buf.format, {})
    end
}
