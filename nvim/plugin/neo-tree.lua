vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/antosha417/nvim-lsp-file-operations",
})

require("lsp-file-operations").setup()
require("neo-tree").setup({})

vim.keymap.set("n", "<leader>ex", "<CMD>Neotree toggle<CR>", { desc = "Open NeoTree (Explorer)" })
