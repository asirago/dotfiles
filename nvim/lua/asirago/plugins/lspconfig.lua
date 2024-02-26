return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp", { "antosha417/nvim-lsp-file-operations", config = true } },
    config = function()
        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local map = function(mode, lhs, rhs, opts)
            if opts.desc then
                opts.desc = opts.desc .. " [lsp]"
            end

            vim.keymap.set(mode, lhs, rhs, { silent = true, desc = opts.desc })
        end

        local on_attach = function(client, bufnr)
            -- keybind options
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- set keybinds
            opts.desc = "show lsp references"
            map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
            opts.desc = "go to declaration"
            map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
            opts.desc = "peek definition"
            map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
            opts.desc = "go to implementation"
            map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
            opts.desc = "code action"
            map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
            opts.desc = "lspsaga renaming"
            map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
            opts.desc = "Show buffer diagnostics"
            map("n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
            opts.desc = "show diagnostics for cursor"
            map("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
            opts.desc = "jump to previous diagnostic in buffer"
            map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
            opts.desc = "jump to next diagnostic in buffer"
            map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
            opts.desc = "lspsaga hover docs"
            map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
            opts.desc = "show documentation for cursor insert mode (inside func call)"
            map("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- show documentation for what is under cursor
            opts.desc = "LSoutlineToggle"
            map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
            opts.desc = "Restart LSP server"
            map("n", "<leader>rr", "<cmd>LspRestart", opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure go server
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
        })

        -- configure tsserver
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure emmet language server
        lspconfig["emmet_language_server"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim", "hs" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
        --
        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
            },
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = false,
            float = true,
        })
    end,
}
