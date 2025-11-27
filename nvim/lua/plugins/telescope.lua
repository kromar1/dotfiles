return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- 1. Setup the Look and Feel
			require("telescope").setup({
				defaults = {
					-- This makes the layout look more like VS Code (preview on the right)
					layout_strategy = "horizontal",
					layout_config = {
						prompt_position = "top", -- Search bar at the top
						width = 0.9, -- Use 90% of screen width
					},
					sorting_strategy = "ascending", -- List results from top down
				},
			})

			-- 2. Define Keymaps
			local builtin = require("telescope.builtin")

			-- Find Files (Cmd+P equivalent)
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })

			-- Live Grep (Cmd+Shift+F equivalent - Requires Ripgrep installed!)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search Text" })

			-- Find Buffers (Switch Tabs)
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

			-- Help Tags
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })

			-- Browse Clipboard History (Registers)
			vim.keymap.set("n", "<leader>fp", ":Telescope registers<CR>", { desc = "Find Paste History" })
		end,
	},
}
