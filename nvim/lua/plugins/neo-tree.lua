return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
			"antosha417/nvim-lsp-file-operations",
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module 'neo-tree'
		---@type neotree.Config
		opts = {},
		config = function()
			require("lsp-file-operations").setup()

			require("neo-tree").setup({})

			vim.keymap.set("n", "<leader>ex", "<CMD>Neotree toggle<CR>", { desc = "Open NeoTree (Explorer)" })
		end,
	},
}
