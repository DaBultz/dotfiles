return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
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
				-- Data Formats
				"json",
				"yaml",
				-- Databases
				"sql",
				-- Elixir
				"elixir",
				"heex",
				"surface",
				"eex",
				-- Other Languages
				"ruby"
			},
			highlight = { enable = true },
			indent = { enable = false },
			auto_install = false,
		})
	end,
}
