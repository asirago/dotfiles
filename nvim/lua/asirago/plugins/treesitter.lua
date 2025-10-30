return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        vim.filetype.add({
            pattern = {
                [".*ghostty/config"] = "ini",
            },
        })

        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "python",
                "json",
                "rust",
                "devicetree",
                "java",
                "dockerfile",
                "javascript",
                "typescript",
                "tsx",
                "go",
                "gomod",
                "gowork",
                "gotmpl",
                "comment",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "graphql",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "dockerfile",
                "gitignore",
            },
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },

            indent = { enable = true },

            auto_install = true,
        })
    end,
}
