return {
  'folke/trouble.nvim',
  branch = 'dev',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup {
      focus = true, -- Focus when opening
    }

    vim.keymap.set('n', 'T', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[T]rouble [T]oggle Diagnostics' })
  end,
}
