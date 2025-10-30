vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client then
            vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO, { title = "LSP" })
        end

        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc .. " [lsp]" })
        end

        local next_diag = function()
            vim.diagnostic.jump({ forward = true, count = 1 })
        end

        local prev_diag = function()
            vim.diagnostic.jump({ count = -1 })
        end

        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
        local next_diag_repeat, prev_diag_repeat = ts_repeat_move.make_repeatable_move_pair(next_diag, prev_diag)
        map("n", "gr", "<cmd>Telescope lsp_references<CR>", "show lsp references")
        map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "go to declaration")
        map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", "peek definition")
        map("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", "[T]ype definition")
        map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "go to implementation")
        map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", "document symbol")
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "[c]ode [a]ction")
        map("n", "<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
        map("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
        map("n", "<leader>fD", "<cmd>Telescope diagnostics<CR>", "Show buffer diagnostics")
        map("n", "]d", next_diag_repeat, "jump to next diagnostic in buffer")
        map("n", "[d", prev_diag_repeat, "jump to previous diagnostic in buffer")
        map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "hover docs")
        map("n", "<leader>rr", "<cmd>LspRestart<CR>", "Restart LSP server")

        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
})
