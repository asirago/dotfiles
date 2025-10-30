return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            signcolumn = true,
            numhl = false,

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local map = function(mode, lhs, rhs, desc)
                    if desc then
                        desc = desc .. " [git]"
                    end

                    vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
                end

                local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

                local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)

                -- Navigation
                map("n", "]h", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        next_hunk_repeat()
                    end)
                    return "<Ignore>"
                end, "jump to next hunk")

                map("n", "[h", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        prev_hunk_repeat()
                    end)
                    return "<Ignore>"
                end, "jump to previous hunk")

                vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#238536", bg = "NONE" })
                vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFF085", bg = "NONE" })
                --
                vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "NONE", bg = "NONE" })

                local wk = require("which-key")

                wk.add({
                    { "<leader>g", group = "Git" },
                    { "<leader>gs", gs.stage_hunk, desc = "stage unks", mode = { "n", "v" } },
                    { "<leader>gu", gs.undo_stage_hunk, desc = "undo stage unks", mode = { "n", "v" } },
                    { "<leader>gS", gs.stage_buffer, desc = "stage buffer", mode = "n" },
                    { "<leader>gp", gs.preview_hunk, desc = "preview_hunk", mode = "n" },
                    {
                        "<leader>gb",
                        function()
                            gs.blame_line({ full = true })
                        end,
                        desc = "git blame",
                        mode = "n",
                    },
                    { "<leader>gt", gs.toggle_current_line_blame, desc = "toggle current line blame", mode = "n" },
                })

                map("n", "<leader>td", gs.toggle_deleted, "toggle deleted")
            end,
        })
    end,
}
