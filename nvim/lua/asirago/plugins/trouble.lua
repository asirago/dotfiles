return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("trouble").setup({
      height = 25,
    })

    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc .. " [trouble]"
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    map("n", "<leader>xt", function()
      require("trouble").toggle()
    end, "toggle trouble")

    map("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, "workspace diagnostics")

    map("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, "document diagnostics")

    map("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, "quickfix")

    map("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, "location list")
  end,
}
