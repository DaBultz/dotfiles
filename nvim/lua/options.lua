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

-- File types
vim.filetype.add({
	extension = {
		rbi = "ruby",
	},
})
