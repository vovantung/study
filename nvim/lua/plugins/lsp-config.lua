return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.jdtls.setup({})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})
            vim.keymap.set({ 'n', 'v' }, '<C-a>', vim.lsp.buf.code_action, {})
        end
    }
}
