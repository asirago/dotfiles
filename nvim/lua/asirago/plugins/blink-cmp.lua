return {
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", ft = { "sql", "down.sql", "up.sql" } },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "down.sql", "up.sql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1

            vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Opening DBUI Toggle" })
        end,
    },
    {
        "saghen/blink.cmp",

        dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

        version = "1.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            enabled = function()
                local filetype = vim.bo.filetype

                if filetype == "NvimTree" or filetype == "DressingInput" then
                    return false
                end
                return true
            end,
            keymap = {
                preset = "default",
                -- ["<ESC>"] = { "hide", "fallback" },
                ["<C-u>"] = { "scroll_signature_up", "fallback" },
                ["<C-d>"] = { "scroll_signature_down", "fallback" },
                ["<C-n>"] = { "select_next", "show", "fallback_to_mappings" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
                kind_icons = {
                    Text = "󰉿",
                    Keyword = "󰌆",
                    Snippet = "",
                },
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        border = "single",
                    },
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                keyword = {
                    range = "prefix",
                },
                menu = {
                    border = "single",
                    scrolloff = 50,
                    scrollbar = true,
                    draw = {
                        gap = 2,
                        columns = {
                            { "kind_icon", "label", "label_description", gap = 2 },
                            { "kind" },
                            { "source_name" },
                        },
                    },
                },
            },

            snippets = { preset = "luasnip" },

            sources = {
                default = { "snippets", "lsp", "buffer", "path" },
                per_filetype = {
                    sql = { "dadbod", "snippets", "buffer" },
                },
                providers = {
                    lsp = {
                        name = "[LSP]",
                        score_offset = 10,
                    },
                    buffer = {
                        min_keyword_length = 2,
                    },
                    snippets = {
                        name = "luasnip",
                        score_offset = 21,
                        min_keyword_length = 2,
                    },
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                    },
                },
            },

            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },

        opts_extend = { "sources.default" },
    },
}
