return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Lua
				"lua-language-server",
				"stylua",
				-- Elixir
				-- "typescript-language-server",
				-- "elixir-ls",
				-- "tailwindcss-language-server",
				-- "emmet-language-server",
				-- Systems programming
				"clangd",
				"clang-format",
				"qmlls",
			},
		})
	end,
}
