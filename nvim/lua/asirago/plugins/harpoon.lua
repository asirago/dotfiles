return {
  "theprimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc .. " [harpoon]"
      end

      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end

    map("n", "<leader>a", mark.add_file, "add file to Harpoon list")
    map("n", "<C-e>", ui.toggle_quick_menu, "toggle quick menu")

    map("n", "<leader>h", function()
      ui.nav_file(1)
    end, "Harpoon file 1")
    map("n", "<leader>j", function()
      ui.nav_file(2)
    end, "Harpoon file 2")
    map("n", "<leader>k", function()
      ui.nav_file(3)
    end, "Harpoon file 3")
    map("n", "<leader>l", function()
      ui.nav_file(4)
    end, "Harpoon file 4")
    -- map("n", "<leader>5", function()
    -- 	ui.nav_file(5)
    -- end, "Harpoon file 5" )
    -- map("n", "<leader>6", function()
    -- 	ui.nav_file(6)
    -- end, "Harpoon file 6" )
    -- map("n", "<leader>6", function()
    -- 	ui.nav_file(8)
    -- end, "Harpoon file 6" )
    -- map("n", "<leader>7", function()
    -- 	ui.nav_file(7)
    -- end, "Harpoon file 7" )
  end,
}
