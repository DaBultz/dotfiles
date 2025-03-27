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

local opts = { noremap = true, silent = true }

-- remap leader key
vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "use h to move!!"<cr>')
vim.keymap.set("n", "<right>", '<cmd>echo "use l to move!!"<cr>')
vim.keymap.set("n", "<up>", '<cmd>echo "use k to move!!"<cr>')
vim.keymap.set("n", "<down>", '<cmd>echo "use j to move!!"<cr>')

vim.keymap.set("n", "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('vscode').action('periscope.search')<CR>")

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("noh")
end, opts)

-- Window/Buffer Navigation
vim.keymap.set("n", "<M-h>", "<Cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>")
vim.keymap.set("n", "<M-j>", "<Cmd>lua require('vscode').action('workbench.action.navigateDown')<CR>")
vim.keymap.set("n", "<M-k>", "<Cmd>lua require('vscode').action('workbench.action.navigateUp')<CR>")
vim.keymap.set("n", "<M-l>", "<Cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>")
