-- Typescript tools
require('typescript-tools').setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- require('lspconfig').tsserver.setup {}
