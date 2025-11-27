return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				-- Set to "true" to center the renaming window
				relative = "editor",
				title_pos = "center",
			},
			select = {
				-- This makes the Code Action menu look like Telescope
				backend = { "telescope", "builtin" },
			},
		})
	end,
}
