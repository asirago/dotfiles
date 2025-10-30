return {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
            on_colors = function(_) end,

            on_highlights = function(hl, _)
                hl["@lsp.type.keyword"] = { fg = "#FFFFFF" }
                hl["BlinkCmpKindFunction"] = { fg = "#FF78C6" }
                hl["BlinkCmpKindKeyword"] = { fg = "#FF78C6" }
                hl["BlinkCmpKindSnippet"] = { fg = "#FFFFFF" }
                hl["BlinkCmpKindVariable"] = { fg = "#C8C9C7" }
                hl["BlinkCmpKindMethod"] = { fg = "#CBA6F7" }
                hl["@keyword.namespace"] = { fg = "#fde047" } -- package [main]
                hl["@keyword.import"] = { fg = "#fb923c" } -- package [main]
                hl["@variable"] = { fg = "#C8C9C7" } -- [a] := 127
                hl["@keyword.function"] = { fg = "#FF78C6" } -- [func] testFunc(a, b int)
                hl["@repeat"] = { fg = "#FF78C6" } -- [for] {} [while] {}
                hl["@operator"] = { fg = "#FF78C6" } -- a [:=] 7 or i[++] e.g operators such as +-*=/
                hl["@include"] = { fg = "#0ea5e9" } -- [package] and [import]
            end,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
