return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { desc = "Cycle to next LuaSnip choice" })
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { desc = "Cycle to next LuaSnip choice" })

        ls.setup({
            history = true,
            -- This tells LuaSnip to remember to keep around the last snippet.
            -- You can jump back into it even if you move outside of the selection
            -- This one is cool cause if you have dynamic snippets, it updates as you type!
            updateevents = "TextChanged,TextChangedI",
            region_check_events = "InsertEnter,CursorMoved",
            delete_check_events = "TextChanged,InsertLeave",
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "●", "GruvboxRed" } },
                        hl_group = "combine",
                    },
                },
            },

            -- Autosnippets:
            enable_autosnippets = false,
        })

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local c = ls.choice_node
        local func = ls.function_node
        local extras = require("luasnip.extras")
        local rep = extras.rep
        local fmt = require("luasnip.extras.fmt").fmt
        ls.add_snippets("all", {
            s(
                "uss",
                fmt("const [{}, {}] = useState({});\n{}", {
                    i(1),
                    func(function(arg)
                        return "set" .. arg[1][1]:sub(1, 1):upper() .. arg[1][1]:sub(2)
                    end, 1),
                    i(2),
                    i(0),
                })
            ),
            s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
            s(
                "box",
                fmt(
                    [[
                      ==================== {} ====================
                      {}
                  ]],
                    {
                        i(1),
                        i(0),
                    }
                )
            ),
        })
        ls.add_snippets("go", {
            s(
                "iferr",
                fmt(
                    [[
                if err != nil {{
                    {}
                }}
                {}
                 ]],
                    {
                        c(1, { t('log.Fatal("error: ", err)'), t(""), t("return err"), t("panic(err)") }),
                        i(0),
                    }
                )
            ),
            s(
                "main",
                fmt(
                    [[
                func main() {{
                    {}
                }}
                {}
            ]],
                    {
                        i(1),
                        i(0),
                    }
                )
            ),
            s(
                "fun",
                fmt(
                    [[
                        func {}({}) {{
                            {}
                        }}
                    ]],
                    {
                        i(1, "name"),
                        i(2, ""),
                        i(3),
                    }
                )
            ),
            s(
                "fori",
                fmt(
                    [[
                        for {} := 0; {} < {}; {}++ {{
                            {}
                        }}
                    ]],
                    {
                        i(1, "i"),
                        rep(1),
                        i(2, "n"),
                        rep(1),
                        i(0),
                    }
                )
            ),
            s(
                "pf",
                fmt([[fmt.Printf("%{}\n", {})]], {
                    i(1),
                    i(2, "var"),
                })
            ),
            s(
                "print",
                fmt([[fmt.Println("{}")]], {
                    i(1),
                })
            ),
            s(
                "struct",
                fmt(
                    [[
                        type {} struct {{
                            {}
                        }}
                    ]],
                    {
                        i(1, "Name"),
                        i(0),
                    }
                )
            ),
            s(
                "handler",
                fmt(
                    [[
                        func {}(w http.ResponseWriter, r *http.Request) {{
                            {}
                        }}
                    ]],
                    { i(1, "handleSomething"), i(0) }
                )
            ),
        })
        ls.add_snippets("javascript", {
            s(
                "rafce",
                fmt(
                    [[
                    function {}() {{
                        return (
                            <div>
                                <h1>Hello World</h1>
                            </div>
                        )
                    }}

                    export default {}
                ]],
                    { i(1), rep(1) }
                )
            ),
        })
        ls.filetype_extend("typescript", { "javascript" })
        ls.filetype_extend("typescriptreact", { "javascript" })
        ls.filetype_extend("javascriptreact", { "javascript" })
    end,
}
