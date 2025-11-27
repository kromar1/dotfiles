return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- You likely already have this for Lualine
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it's the last window left
			window = {
				width = 30, -- Width of the sidebar
			},
			filesystem = {
				filtered_items = {
					visible = true, -- This makes hidden files (like .env) visible by default
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true, -- Focus the file in the tree when you open it
				},
			},
		})
	end,
}
