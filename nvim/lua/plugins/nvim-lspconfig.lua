return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- 1. Setup Mason (The installer)
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
		vim.opt.shortmess:remove("c") -- optional, makes print visible

		-- 2. Prepare the "Capabilities" (The connection to nvim-cmp)
		-- This enables the autocomplete to talk to the LSP
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, desc = "LSP" }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			-- Show the error/hint message in a floating window
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
		end

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls", -- TypeScript/JS
				"html", -- HTML
				"cssls", -- CSS
				"lua_ls", -- Lua
				"elmls", -- elm
			},
		})

		-- Global defaults (new-style servers)
		vim.lsp.config("*", { on_attach = on_attach, capabilities = capabilities })

		-- Force legacy servers to use your on_attach too
		local legacy_servers = { "ts_ls", "html", "cssls", "elmls" }
		for _, server in ipairs(legacy_servers) do
			vim.lsp.config(server, { on_attach = on_attach, capabilities = capabilities })
		end

		-- Lua-specific settings (still needed)
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
		})

		-- Add borders to floating windows (Hover and Diagnostics)
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})
	end,
}
