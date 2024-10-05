return {
	{
		'marko-cerovac/material.nvim',
		lazy = false,
	},
	{
		'rose-pine/neovim',
		lazy = false,
		name = 'rose-pine',
		config = function() 
			require('rose-pine').setup {
				
			}
			vim.cmd("colorscheme rose-pine")
		end
	}
}
