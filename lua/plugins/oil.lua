return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      keymaps = {
        ['..'] = 'actions.parent',
      },
    }
  end,
}
