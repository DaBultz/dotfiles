return {
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      -- vim.cmd.colorscheme("onedark")
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'carbonfox'
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {
        -- ...
      }
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
}
