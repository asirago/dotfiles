return {
    "christoomey/vim-tmux-navigator",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
        config = function()
            require("lspsaga").setup({
                definition = {
                    keys = {},
                },
                code_action_prompt = {
                    enable = false,
                },
                ui = {
                    code_action = "",
                    colors = {
                        normal_bg = "#022746",
                    },
                },
                diagnostic = {
                    show_code_action = false,
                },
            })
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
                char = {
                    enabled = false,
                },
            },
        },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").teeesitter() end, desc = "Flash Treesitter" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local setup, lualine = pcall(require, "lualine")
            if not setup then
                return
            end

            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = "codedark",
                },
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
        end,
    },
    {
        "szw/vim-maximizer",
        keys = {
            { "<leader>mm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
            { "<C-w>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
        },
    },
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "theprimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            local map = function(mode, lhs, rhs, desc)
                if desc then
                    desc = desc .. " [harpoon]"
                end

                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            end

            map("n", "<leader>a", mark.add_file, "add file to Harpoon list")
            map("n", "<C-e>", ui.toggle_quick_menu, "toggle quick menu")

            map("n", "<leader>h", function()
                ui.nav_file(1)
            end, "Harpoon file 1")

            map("n", "<leader>j", function()
                ui.nav_file(2)
            end, "Harpoon file 2")

            map("n", "<leader>k", function()
                ui.nav_file(3)
            end, "Harpoon file 3")

            map("n", "<leader>l", function()
                ui.nav_file(4)
            end, "Harpoon file 4")

            map("n", "<leader>;", function()
                ui.nav_file(5)
            end, "Harpoon file 5")

            map("n", "<leader>'", function()
                ui.nav_file(6)
            end, "Harpoon file 6")

            map("n", "<leader>.", function()
                ui.nav_file(7)
            end, "Harpoon file 7")
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({})
            local map = function(mode, lhs, rhs, desc)
                if desc then
                    desc = desc .. " [todo-comments]"
                end

                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            end

            map("n", "]t", function()
                require("todo-comments").jump_next()
            end, "next comment")

            map("n", "[t", function()
                require("todo-comments").jump_prev()
            end, "previous comment")

            map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", "todo telescope")
            map("n", "<leader>tt", "<cmd>TodoTrouble toggle<CR>", "todo trouble")
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            require("trouble").setup({
                height = 25,
            })

            local map = function(mode, lhs, rhs, desc)
                if desc then
                    desc = desc .. " [trouble]"
                end

                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
            end

            map("n", "<leader>xt", "<cmd>Trouble diagnostics toggle focus=true<CR>", "toggle diagnostics trouble")

            map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>", "current buffer - toggle diagnostics")

            map("n", "<leader>xq", function()
                require("trouble").toggle("quickfix")
            end, "quickfix")

            map("n", "<leader>xl", function()
                require("trouble").toggle("loclist")
            end, "location list")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                python = { "ruff" },
            }

            -- Run linting on save
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    go = { "gofmt", "goimports", "golines" },
                    lua = { "stylua" },
                    python = {
                        "ruff_fix",
                        "ruff_format",
                        "ruff_organize_imports",
                    },
                    -- add more as you see fit
                },
                format_on_save = function(bufnr)
                    -- Disable with a global or buffer-local variable
                    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                        return
                    end
                    return { timeout_ms = 500, lsp_fallback = true }
                end,
            })

            vim.keymap.set({ "n", "v" }, "<leader>S", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = "Fromat file or range (in visual mode)" })
        end,
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup({})

            local map = vim.keymap.set

            map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "DiffViewOpen - DiffView" })
            map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "DiffViewClose - DiffView" })
            map("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", { desc = "DiffViewFileHistory" })
            map("n", "<leader>dfh", "<cmd>DiffviewFileHistory<CR>", { desc = "DIFFVIEW DECIDE LATER" })
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            "ibhagwan/fzf-lua", -- optional
        },
        config = function()
            local map = vim.keymap.set
            map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
        end,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        ft = "lua",
        opts = { -- set to setup table
        },
    },
    {
        "asirago/blend.nvim",
        opts = {
            disable_default = false,
        },
    },
}
