return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- 'windwp/nvim-ts-autotag',
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- require('nvim-ts-autotag').setup()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"markdown",
				"markdown_inline",
				"vimdoc",
				-- Web Development
				"json",
				"yaml",
				-- Programming
				"zig",
				-- Go
				"go",
				"gomod",
				"gosum",
				"gowork",
				"sql",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = false,
		})
	end,
}
