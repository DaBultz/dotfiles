-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	group = vim.api.nvim_create_augroup("format_git_commit", { clear = true }),
	callback = function()
		-- Set textwidith to 72
		vim.cmd("set tw=72")
		-- Show Colum
		vim.cmd("set cc=73")
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype for jbuilder file",
	pattern = "*.json.jbuilder",
	command = "set filetype=ruby",
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.stdout:write("\027]111;;\027\\")
	end,
})

-- Set the terminal colors on colorscheme, this works on WezTerm
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
		io.stdout:write(("\027]11;#%06x\027\\"):format(bg))
	end,
})
