return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"hrsh7th/cmp-buffer", -- Buffer source
		"hrsh7th/cmp-path", -- Path source
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Adapter for LuaSnip
		"rafamadriz/friendly-snippets", -- Pre-made snippets for JS/React/HTML
		"onsails/lspkind.nvim", -- VS Code-like icons
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		-- Load "friendly-snippets" (VS Code style snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			-- 1. Snippet Engine (REQUIRED)
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- 2. Window Styling (Rounded borders to match Ghostty/Neo-tree)
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			-- 3. Keymappings
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up
				["<C-j>"] = cmp.mapping.select_next_item(), -- Move down
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- Trigger menu manually
				["<C-e>"] = cmp.mapping.abort(), -- Close menu
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm selection
			}),

			-- 4. Sources (Order matters: Top = higher priority)
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- Data from the Language Server
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Words from the current file
				{ name = "path" }, -- File system paths
			}),

			-- 5. Formatting (The Icons)
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						path = "[Path]",
					},
				}),
			},
		})
	end,
}
