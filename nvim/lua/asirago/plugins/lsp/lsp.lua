return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "shagen/blink.cmp",
        },
        config = function()
            vim.defer_fn(function()
                local cmp = require("blink.cmp")

                local capabilities = cmp.get_lsp_capabilities()

                vim.lsp.config("*", {
                    capabilities = capabilities,
                })
            end, 500)
        end,
    },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
}
