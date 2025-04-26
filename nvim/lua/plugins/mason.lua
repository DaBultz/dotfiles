return {
	"williamboman/mason.nvim",
  build = ":MasonUpdate", 
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require('mason-tool-installer').setup {
			ensure_installed = {}
		}
	end
}
