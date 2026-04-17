-- Set the map leader, this is required before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Share clipboard between vim and OS
vim.opt.clipboard = "unnamedplus"

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- Configure how splits should open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure the tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.pumheight = 15 -- this controlls how many lines the popup menu has

-- Keep cursor centoer
vim.opt.scrolloff = 10

-- Spell checker
vim.opt.spelllang = "en_us"
vim.opt.spell = false

vim.diagnostic.config({
	virtual_text = true,
})

vim.opt.swapfile = false -- Disable swap files
vim.opt.winborder = "rounded"

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use ALT+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
