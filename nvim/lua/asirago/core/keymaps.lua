vim.g.mapleader = " "
---@diagnostic disable-next-line: lowercase-global
map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")

map("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to clipboard" })

-- Reload configuration without restart nvim
map("n", "<leader>s", ":w<CR>", { desc = "Save File" })

map("x", "<leader>p", '"_dP', { desc = "Paste and keep old register" })

map("v", "<leader>d", '"_d', { desc = "Delete to void register" })
map("x", "<leader>d", '"_d', { desc = "Delete to void register" })
-- Fast saving with <leader> and s
map("n", "<leader>r", ":so<CR>", { desc = "Source file" })
map("n", "<leader>v", "<cmd>!ls<CR>", { desc = "Placeholder can change, right now ls" })

-- Split Maximizer
map("n", "<leader>m", "<cmd>MaximizerToggle<CR>", { desc = "MaximizerToggle" })

-- Refresh All Buffers After GitHub Branch Switch
map("n", "<leader>bb", "<cmd>bufdo e<cr>", { desc = "Refresh All Buffers" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>bn", ":bn<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", ":bp<CR>", { desc = "Prev Buffer" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete Buffer" })
map("n", "<leader>q", ":bd|bn<CR>")

map("n", "<S-enter>", "O<ESC>")
map("i", "<S-enter>", "<ESC>o")

map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename under cursor withing file" })
map("n", "<C-y>", "<C-^>")

map("n", "<C-w>>", ":vertical resize +15<CR>")
map("n", "<C-w><", ":vertical resize -15<CR>")

map("n", "<C-w>+", ":horizontal resize +15<CR>")
map("n", "<C-w>-", ":horizontal resize -15<CR>")

map("n", "<leader>L", "<cmd>Lazy<CR>")
-- map("n", "<leader><", ":silent vertical resize -15<CR>")
-- map("n", "<leader>>", ":silent vertical resize +15<CR>")

-- think about adding <leader>x to make current file executable, if you ever need it in the future
