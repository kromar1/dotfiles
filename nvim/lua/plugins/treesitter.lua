return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Automatically update parsers
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"c", "lua", "vim", "vimdoc", "query", -- Core required
				"javascript", "typescript", "html", "css", -- Web Dev
				"erlang"           -- Your specific request
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Highlight module
			highlight = {
				enable = true, -- THE MOST IMPORTANT SETTING

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},

			-- Indentation based on treesitter for the = operator
			indent = { enable = true },
		})
	end,
}
