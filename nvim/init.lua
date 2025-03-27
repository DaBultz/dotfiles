---@diagnostic disable: undefined-field

require("options")

-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
	require("lazy").setup("vscode_plugins", {})
	require("vscode_options")
else
	require("lazy").setup("plugins", {})
	-- Keymap and autocommands
	require("keymap")
	require("autocommands")
	require("colorscheme")
end
