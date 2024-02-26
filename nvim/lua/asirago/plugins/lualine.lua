return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local setup, lualine = pcall(require, "lualine")
		if not setup then
			return
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "codedark",
			},
		})
	end,
}
