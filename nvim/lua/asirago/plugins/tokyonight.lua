return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
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

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      -- ---@param colors ColorScheme
      -- on_colors = function(colors) end,
      --
      -- --- You can override specific highlights to use other groups or a hex color
      -- --- function will be called with a Highlights and ColorScheme table
      -- ---@param highlights Highlights
      -- ---@param colors ColorScheme
      -- on_highlights = function(highlights, colors) end,
      on_highlights = function(hl, c)
        -- hl["@define"] = { fg = "#FF0000" }
        hl["@lsp.type.keyword"] = { fg = "#FF78C6" }
        -- hl["@lsp..class"] = { fg = "#FF0000" }
        -- hl["@function.macro"] = { fg = "#FF0000" }
        -- hl["@comment"] = { fg = "#008000" }
        --
        -- -- KNOWN --
        -- hl["@method"] = { fg = "#46C76B" } -- func (p *Person) [getAge]() {
        hl["@namespace"] = { fg = "#fde047" } -- package [main]
        hl["@variable"] = { fg = "#C8C9C7" } -- [a] := 127
        -- hl["@punctutation.bracket"] = { fg = "#C8C9C7" } -- {} [] ()
        --
        -- -- TYPES
        -- -- hl["@type"] = { fg = "#14b8a6" } -- usual types like http.[Client]
        -- -- hl["@type.builtin"] = { fg = "#14b8a6" } -- built in types such as bool, int etc
        -- -- hl["@type.definition"] = { fg = "#14b8a6" } -- type [Person] struct {}
        -- hl["@type"] = { fg = "#38bdf8" } -- usual types like http.[Client]
        -- hl["@type.builtin"] = { fg = "#c084fc" } -- built in types such as bool, int etc
        -- hl["@type.definition"] = { fg = "#38bdf8" } -- type [Person] struct {}
        --
        -- -- FUNCTION & METHODS
        -- hl["@method.call"] = { fg = "#46C76B" } -- fmt.[Println]()
        -- hl["@function"] = { fg = "#46C76B" } -- func [testFunc](a, b int)
        -- hl["@function.call"] = { fg = "#FF78C6" } -- fmt.[Println]
        -- hl["@function.builtin"] = { fg = "#c084fc" } -- make() len()
        hl["@keyword.function"] = { fg = "#FF78C6" } -- [func] testFunc(a, b int)
        --
        -- -- keywords
        -- hl["@conditional"] = { fg = "#FF78C6" } -- [if] {}
        hl["@repeat"] = { fg = "#FF78C6" } -- [for] {} [while] {}
        -- hl["@field"] = { fg = "#7dd3fc" }
        hl["@operator"] = { fg = "#FF78C6" } -- a [:=] 7 or i[++] e.g operators such as +-*=/
        hl["@include"] = { fg = "#0ea5e9" } -- [package] and [import]
        --
        -- hl["@keyword"] = { fg = "#FF78C6" } -- standard keywords
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
