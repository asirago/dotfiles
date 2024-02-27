return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
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

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, "jump to next hunk")

                map("n", "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, "jump to previous hunk")

                -- Actions

                map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<cr>", "stage hunkts")
                map({ "n", "v" }, "<leader>gu", gs.undo_stage_hunk, "undo stage hunk")
                -- NOTE: check docs about reset_hunks
                map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", "reset hunk")
                map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
                -- map("n", "<leader>ga", gs.stage_hunk)
                -- map("n", "<leader>gr", gs.reset_buffer)
                map("n", "<leader>gp", gs.preview_hunk, "preview hunk")
                map("n", "<leader>gb", function()
                    gs.blame_line({ full = true })
                end, "git blame")
                map("n", "<leader>tb", gs.toggle_current_line_blame, "toggle current line blame")
                map("n", "<leader>gd", gs.diffthis, "diff this file")
                map("n", "<leader>gD", function()
                    gs.diffthis("~")
                end, "something later, not decided yet")
                map("n", "<leader>td", gs.toggle_deleted, "toggle deleted")
                map("n", "<leader>G", "<cmd>Git<CR>", "git fugitive entry")
                map("n", "<leader>P", "<cmd>Git push<CR>", "git push fugitive")
            end,
        })
    end,
}
