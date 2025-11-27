return {
	"shaunsingh/nord.nvim", -- There are several versions, this is a popular one
	lazy = false,
	priority = 1000,
	config = function()
		-- 1. Load the colorscheme
		vim.cmd("colorscheme nord")
	end,
}
