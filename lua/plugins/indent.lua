local useHLChunk = false

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    enabled = not useHLChunk,
    config = function()
      require('ibl').setup {
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
          char = '▏',
        },
        -- See: :help ibl.config.indent.char
        indent = {
          char = '│',
        },
      }
    end,
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'UIEnter' },
    enabled = useHLChunk,
    config = function()
      ---@diagnostic disable: missing-fields
      require('hlchunk').setup {
        ---@diagnostic disable-next-line: missing-fields
        indent = {
          enable = true,
        },
        blank = {
          enable = true,
        },
        line_num = {
          enable = false,
        },
        chunk = {
          enable = true,
        },
        context = {
          enable = false,
        },
      }
    end,
  },
}
