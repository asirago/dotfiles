return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({})

    local keymap = vim.keymap.set

    keymap("n", "<leader>dfo", "<cmd>DiffviewOpen<CR>", { desc = "DiffViewOpen - DiffView" })
    keymap("n", "<leader>dfc", "<cmd>DiffviewClose<CR>", { desc = "DiffViewClose - DiffView" })
    keymap("n", "<leader>dfh", "<cmd>DiffviewFileHistory<CR>", { desc = "DiffViewFileHistory - DiffView" })
    keymap("n", "<leader>dff", "<cmd>DiffviewFileHistory %<CR>", { desc = "DiffViewFileHistory For File - DiffView" })
  end,
}
