return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local types = require("luasnip.util.types")

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
		local insert = ls.insert_node
		local c = ls.choice_node
		local func = ls.function_node
		local extras = require("luasnip.extras")
		local rep = extras.rep
		local fmt = require("luasnip.extras.fmt").fmt
		ls.add_snippets("all", {
			s(
				"uss",
				fmt("const [{}, {}] = useState({});\n", {
					insert(1),
					func(function(arg)
						return "set" .. arg[1][1]:sub(1, 1):upper() .. arg[1][1]:sub(2)
					end, 1),
					insert(2),
				})
			),
			s(
				"iferr",
				fmt(
					[[
            if err != nil {{
              {}
            }}

          ]],
					{
						c(1, { t("log.Fatal(err)"), t("return err") }),
					}
				)
			),
			s("todo", {
				c(1, {
					t("TODO(tjdevries)"),
					t("FIXME(tjdevries)"),
					t("e"),
					t("TODONT(tjdevries)"),
					t("TODO(anybody please help me)"),
				}),
			}),
			s("req", fmt("local {} = require('{}')", { insert(1, "default"), rep(1) })),
		})
		ls.add_snippets("go", {
			s("binary", {
				t("just somethings"),
			}),
		})
	end,
}
