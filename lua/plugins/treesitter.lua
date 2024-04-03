return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    -- 'nvim-treesitter/nvim-treesitter-textobjects',
    -- 'nvim-treesitter/nvim-treesitter-refactor',
    -- 'nvim-treesitter/nvim-treesitter-context',
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-ts-autotag').setup()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      context_commentstring = {
        enable = true,
      },
      ensure_installed = {
        'lua',
        'markdown',
        'markdown_inline',
        'vimdoc',
        -- Web Development
        'javascript',
        'typescript',
        'tsx',
        'json',
        'css',
        'html',
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      -- Auto Tag
      autotag = {
        enablle = true,
        filetypes = {
          'html',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'svelte',
          'vue',
          'tsx',
          'jsx',
          'markdown',
          'astro',
        },
      },
    }
  end,
}
