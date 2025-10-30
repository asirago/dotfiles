return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",

            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        local telescope = require("telescope")

        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules/",
                    "build/",
                    "dist/",
                    ".git/",
                    ".venv",
                },
                layout_config = {
                    width = 0.7,
                    height = 0.7,
                    scroll_speed = 4,
                    horizontal = { preview_width = 0.6 },
                },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },
            },
            extensions = {
                fzf = {},
            },
            pickers = {
                help_tags = {
                    mappings = {
                        i = {
                            ["<CR>"] = "select_vertical",
                        },
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local wk = require("which-key")

        wk.add({
            { "<leader>f", group = "Telescope" },
            { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
            { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep Find Files" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
            { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
            { "<leader>fG", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
            {
                "<leader>fn",
                function()
                    builtin.find_files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = "Find Neovim Config Files",
            },
            {
                "<leader>fp",
                function()
                    builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
                end,
                desc = "Find Plugin files",
            },
        })

        vim.keymap.set("<leader><leader>", "<cmd>Telescope buffers<cr>", "List Buffers")
    end,
}
