return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        -- See: :help ibl.config.indent.char
        indent = {
          char = '▏',
        },
      }
    end,
  },
}
