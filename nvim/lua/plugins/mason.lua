return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Lua
				"lua-language-server",
				"stylua",
				-- Elixir
				"elixir-ls",
				"nextls",
				-- Systems programming
				"clangd",
				"clang-format",
				"ols",
			},
		})
	end,
}
