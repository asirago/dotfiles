return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        -- local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "build",
                    "dist",
                    ".git",
                },
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.7,
                    height = 0.7,
                },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },
                sorting_strategy = "descending",
            },
        })

        -- set keymaps
        local keymap = vim.keymap.set

        keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=false<cr>", { desc = "Find Files - Telescope" })
        keymap("n", "<leader>fp", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files - Telescope" })
        keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep Find Files - Telescope" })
        keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Search String Under Cursor- Telescope" })
        keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers - Telescope" })
        keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags - Telescope" })
        keymap("n", "<leader>fH", "<cmd>Telescope highlights<cr>", { desc = "Highlights - Telescope" })
    end,
}
