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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "Disable spell checker",
	command = "set nospell",
})
vim.cmd("set nospell")

local opts = { noremap = true, silent = true }

-- remap leader key
vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- This stops VSCode from unfolding folded code
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = false, silent = true })

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

-- vim.keymap.set("n", "zM", "editor.foldAll")
-- vim.keymap.set("n", "zR", "editor.unfoldAll")
-- vim.keymap.set("n", "zc", "editor.fold")
-- vim.keymap.set("n", "zC", "editor.foldRecursively")
-- vim.keymap.set("n", "zo", "editor.unfold")
-- vim.keymap.set("n", "zO", "editor.unfoldRecursively")
-- vim.keymap.set("n", "za", "editor.toggleFold")
