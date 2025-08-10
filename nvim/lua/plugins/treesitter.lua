return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"code-biscuits/nvim-biscuits",
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
				"ruby",
				-- Systems
				"cpp",
				"c",
				"glsl",
				"doxygen",
				"odin",
			},
			highlight = { enable = true },
			indent = { enable = false },
			auto_install = true,
		})

		require("nvim-biscuits").setup({
			cursor_line_only = true,
		})
	end,
}
