return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup()

      -- Install Formatters
      require('mason-tool-installer').setup {
        ensure_installed = {
          'stylua',
          'eslint_d',
          'prettierd',
          'codespell',
          'clang-format',
        },
        automatic_installation = false,
      }

      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'tsserver',
          'tailwindcss',
          'html',
          'cssls',
          'jsonls',
          'emmet_language_server',
          'marksman',
          'zls',
          'clangd',
        },
        automatic_installation = false,
      }
    end,
  },
}
