return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        local status, treesitter = pcall(require, "nvim-treesitter.configs")
        if not status then
            return
        end

        treesitter.setup({
            -- A list of parser names, or "all" (the four listed parsers should always be installed)
            ensure_installed = {
                "c",
                "json",
                "java",
                "javascript",
                "typescript",
                "tsx",
                "go",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
            },

            -- enable indentation
            indent = { enable = true },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            autotag = {
                enable = true,
            },

            highlight = {
                enable = true,

                -- list of languages that will be disabled
                disable = {},
            },
        })
    end,
}
