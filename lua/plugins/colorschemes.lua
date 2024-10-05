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
      require('rose-pine').setup {}
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
      require('kanagawa').setup {}
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
      require('github-theme').setup {}
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
