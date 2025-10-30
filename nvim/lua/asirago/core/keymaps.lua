vim.g.mapleader = " "

local map = vim.keymap.set

-- to avoid accidentally opening command history
map("n", "q:", ":", { noremap = true })

-- Keep visual selection after indenting
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")

map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to clipboard" })

-- Reload configuration without restart nvim
map("n", "<leader>s", ":w<CR>", { desc = "Save File" })
map("n", "<leader>w", ":noautocmd w<CR>", { desc = "Save without formatting" })

map("x", "<leader>p", '"_dP', { desc = "Paste and keep old register" })

map({ "n", "v", "x" }, "<leader>d", '"_d', { desc = "Delete to void register" })

-- Fast saving with <leader> and s
map("n", "<leader>r", ":so<CR>", { desc = "Source file" })
map("n", "<leader>v", "<cmd>!ls<CR>", { desc = "Placeholder can change, right now ls" })

-- Refresh All Buffers After GitHub Branch Switch
map("n", "<leader>bb", "<cmd>bufdo e<cr>", { desc = "Refresh All Buffers" })

map("n", "<C-d>", "25jzz")
map("n", "<C-u>", "25kzz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>bn", ":bn<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", ":bp<CR>", { desc = "Prev Buffer" })
map("n", "<leader>bd", "<cmd>DeleteCurrentBuffer<CR>", { desc = "Delete Current Buffer" })
map("n", "<leader>q", "<cmd>DeleteCurrentBuffer<CR>", { desc = "Delete Current Buffer" })

map("n", "<S-enter>", "O<ESC>")
map("i", "<S-enter>", "<ESC>o")

map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename under cursor withing file" })
map("n", "<C-y>", "<C-^>")

map("n", "<C-w>>", ":vertical resize +15<CR>")
map("n", "<C-w><", ":vertical resize -15<CR>")

map("n", "<C-w>+", ":horizontal resize +15<CR>")
map("n", "<C-w>-", ":horizontal resize -15<CR>")

map("n", "<leader>L", "<cmd>Lazy<CR>")

map({ "n", "i" }, "<C-f>", "<C-e>")
map({ "n", "i" }, "<C-b>", "<C-y>")

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlighting" })

map("n", "<leader>XX", "<cmd>source %<cr>", { desc = "sourcing file" })
map("n", "<leader>XS", "<cmd>.lua<cr>", { desc = "running current line lua" })

map("n", "<leader>M", ":Mason<CR>", { desc = "Mason Installer" })

-- Go to next link and open
map({ "n", "x" }, "go", function()
    local found = vim.fn.search([[\(https\?\|www\.\)]], "W")

    if found == 0 then
        vim.notify("No link found", vim.log.WARN, { title = "go" })
        return
    end

    local url = vim.fn.expand("<cWORD>")

    -- Open the link
    vim.cmd.normal("gx")

    -- Notify success
    vim.notify("Launched in browser: " .. url, vim.log.levels.INFO)
end, { desc = "Jump to next link and open it" })

-- copy diagnostics under cursor
map("n", "<leader>cd", function()
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diags = vim.diagnostic.get(0, { lnum = line })
    if vim.tbl_isempty(diags) then
        return print("No diagnostics")
    end

    local msg = table.concat(
        vim.tbl_map(function(d)
            return d.message
        end, diags),
        "\n"
    )
    vim.fn.setreg("+", msg)
    print("Copied diagnostics to clipboard")
end, { desc = "Copy diagnostics on current line" })
