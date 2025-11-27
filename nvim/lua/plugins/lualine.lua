return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord", -- Matches your Ghostty theme
				component_separators = "|",
				--	section_separators = "",
			},
		})
	end,
}
