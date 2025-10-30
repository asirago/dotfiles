return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "pyright",
            "gopls",
            "html",
            "cssls",
            "tailwindcss",
            "emmet_ls",
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
            config = true,
        },
        "neovim/nvim-lspconfig",
    },
}
