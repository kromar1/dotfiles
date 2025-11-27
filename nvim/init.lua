require("config.lazy")

--vim.opt.background = "dark"

-- Change the Diagnostic symbols to Nerd Font icons
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- Move Lines Keymaps (The "VS Code" feel)

-- Normal Mode (Move current line)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move Up" })

-- Visual Mode (Move selected block - SUPER useful for HTML/CSS)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- Insert Mode (Move line while typing)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move Up" })

-- Toggle Neo-tree with Leader+e (Space+e if your leader is Space)
vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", { desc = "Toggle Explorer" })

-- Window Navigation (The "tmux" style)
-- Allows you to switch windows with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus Upper Window" })

-- Quickfix list navigation
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next Quickfix" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Prev Quickfix" })

-- Modern method to set diagnostic icons (No warnings!)
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Disable "backup" files (filename~)
vim.opt.backup = false
vim.opt.writebackup = false

-- Optional: Disable "swap" files (.filename.swp)
-- These are used to recover if Neovim crashes.
-- Most modern devs disable them to avoid the "ATTENTION" prompt.
vim.opt.swapfile = false

-- LINE NUMBERS
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers (See explanation below)

-- INDENTATION (Standard JS/TS/Web setup)
vim.opt.tabstop = 2 -- 2 spaces for tabs (standard for web)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- Expand tabs to spaces
vim.opt.smartindent = true -- Auto-indent new lines

-- SEARCH
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ...unless you type a capital letter
vim.opt.hlsearch = false -- Don't highlight all matches after searching (annoying)
vim.opt.incsearch = true -- Show search results while typing

-- UI / UX
vim.opt.termguicolors = true -- Enable 24-bit RGB color
vim.opt.scrolloff = 8 -- Keep 8 lines above/below the cursor (keeps you centered)
vim.opt.signcolumn = "yes" -- Always show the sign column (prevents text shifting)
vim.opt.isfname:append("@-@") -- Allow filenames to contain '@' (useful for node_modules)

-- SYSTEM CLIPBOARD
vim.opt.clipboard = "unnamedplus" -- Sync with Mac system clipboard (Cmd+C / Cmd+V)

-- UNDO HISTORY
vim.opt.undofile = true -- Persistent undo! (Explain below)
