return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,

                    lookahead = true,

                    keymaps = {
                        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                        -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
                        ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
                        ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
                        ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
                        ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

                        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

                        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                        ["at"] = { query = "@field", desc = "Select outer part of a loop" },
                        ["it"] = { query = "@field", desc = "Select inner part of a loop" },

                        ["af"] = {
                            query = "@function.outer",
                            desc = "Select outer part of a method/function definition",
                        },
                        ["if"] = {
                            query = "@function.inner",
                            desc = "Select inner part of a method/function definition",
                        },

                        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["]p"] = "@parameter.inner", -- swap parameters/argument with next
                        ["<leader>np"] = "@property.outer", -- swap object property with next
                        ["<leader>nP"] = "@parameter.outer", -- swap object property with next
                        ["<leader>nf"] = "@function.outer", -- swap function with next
                    },
                    swap_previous = {
                        ["[p"] = "@parameter.inner", -- swap parameters/argument with prev
                        ["<leader>pp"] = "@property.outer", -- swap object property with prev
                        ["<leader>pP"] = "@parameter.outer", -- swap object property with prev
                        ["<leader>pf"] = "@function.outer", -- swap function with previous
                    },
                },

                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]a"] = { query = "@parameter.outer", desc = "Next method/function def start" },
                        ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
                        ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                        ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
                    },
                    goto_next_end = {
                        ["]A"] = { query = "@parameter.outer", desc = "Next method/function def start" },
                        ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
                        ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                    },
                    goto_previous_start = {
                        ["[a"] = { query = "@parameter.outer", desc = "Next method/function def start" },
                        ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
                        ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                        ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
                    },
                    goto_previous_end = {
                        ["[A"] = { query = "@parameter.outer", desc = "Next method/function def start" },
                        ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
                        ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                        ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
                    },
                },
            },
        })
        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

        local next_link, prev_link = ts_repeat_move.make_repeatable_move_pair(function()
            vim.fn.search([[\(https\?\|www\.\)]], "W")
        end, function()
            vim.fn.search([[\(https\?\|www\.\)]], "bW")
        end)

        local map = vim.keymap.set

        map("n", "]x", next_link, { desc = "Next link" })
        map("n", "[x", prev_link, { desc = "Previous link" })

        -- vim way: ; goes to the direction you were moving.
        map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

        map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
}
