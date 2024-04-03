return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'folke/neodev.nvim' },
    config = function()
      require('neodev').setup()
      -- Language Servers
      require 'servers.luals'
    end,
  },
}
