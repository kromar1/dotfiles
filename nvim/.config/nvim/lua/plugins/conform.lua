return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Load this plugin when opening a file
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Map filetypes to their formatters
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" }, -- Use stylua for Lua files (optional)
				elm = { "elm_format" }, -- Use the dedicated binary for Elm (faster/simpler)
			},
			-- Set up format-on-save (mimics VS Code behavior)
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 750,
			},
		})
	end,
}
