return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'folke/neodev.nvim' },
    config = function()
      -- Neovim LSP
      require('neodev').setup()
      -- Language Servers
      require 'servers.luals'
      require 'servers.typescript'
      require 'servers.css'
      require 'servers.json'
      require 'servers.tailwindcss'
      require 'servers.html'
      require 'servers.emmet'
    end,
  },
}
