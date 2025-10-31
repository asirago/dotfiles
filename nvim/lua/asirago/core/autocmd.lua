local group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

local print_commands = {
    console_log = "y$o<CR>console.log(<c-r>0)<Esc>",
}

local filetype_mappings = {
    go = {
        ["<leader>pr"] = "y$o<CR>fmt.Println(<c-r>0)<Esc>",
    },
    javascript = {
        ["<leader>pr"] = print_commands.console_log,
    },
    javascriptreact = {
        ["<leader>pr"] = print_commands.console_log,
    },
    typescript = {
        ["<leader>pr"] = print_commands.console_log,
    },
    typescriptreact = {
        ["<leader>pr"] = print_commands.console_log,
    },
    lua = {
        ["<leader>pr"] = "y$o<CR>vim.print(<c-r>0)<Esc>",
    },
    rust = {
        ["<leader>pr"] = 'y$o<CR>println!("<C-r>0: {}", <C-r>0)<Esc>',
    },
}
local autoPrintDebugGroup = vim.api.nvim_create_augroup("AutoPrintDebug", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = autoPrintDebugGroup,
    pattern = vim.tbl_keys(filetype_mappings),
    callback = function()
        local ft = vim.bo.filetype

        if not filetype_mappings[ft] then
            return
        end

        for lhs, rhs in pairs(filetype_mappings[ft]) do
            vim.keymap.set("v", lhs, rhs, { buffer = true, desc = "print variable" })
        end
    end,
})
