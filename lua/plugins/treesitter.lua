return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    -- 'nvim-treesitter/nvim-treesitter-textobjects',
    -- 'nvim-treesitter/nvim-treesitter-refactor',
    -- 'nvim-treesitter/nvim-treesitter-context',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    -- require('nvim-ts-autotag').setup()
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
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
        -- Programming
        'zig',
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      -- Auto Tag
      autotag = {
        enable = false,
        -- filetypes = {
        --   'html',
        --   'javascript',
        --   'typescript',
        --   'javascriptreact',
        --   'typescriptreact',
        --   'svelte',
        --   'vue',
        --   'tsx',
        --   'jsx',
        --   'markdown',
        --   'astro',
        -- },
      },
    }
  end,
}
