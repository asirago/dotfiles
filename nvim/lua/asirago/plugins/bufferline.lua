return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.opt.termguicolors = true

    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc .. " [bufferline]"
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    local bufferline = require("bufferline")

    map("n", "gp", ":BufferLinePick<CR>", "pick bufferline")
    map("n", "gP", ":BufferLineTogglePin<CR>", "toggle pin buffer")
    map("n", "gt", ":BufferLineCycleNext<CR>", "cycle next buffer")
    map("n", "gT", ":BufferLineCyclePrev<CR>", "cycle previous buffer")
    map("n", "]b", ":BufferLineMoveNext<CR>", "move buffer to the right")
    map("n", "[b", ":BufferLineMovePrev<CR>", "move buffer to the left")

    bufferline.setup({
      options = {
        mode = "buffers",
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        tab_size = 25,
        diagnostics = true,
        separator_style = "thin",
        indicator = {
          style = "underline",
        },

        highlights = {
          fill = {
            bg = {
              attribute = "fg",
              highlight = "Pmenu",
            },
          },
        },
        close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"

        -- enforce_regular_tabs = false,
        offsets = {
          {
            filetype = "NvimTree",
            -- text = function()
            -- 	return vim.fn.getcwd()
            -- end,
            text_align = "left",
            separator = true,
          },
        },
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          },
        },
      },
    })
  end,
}
