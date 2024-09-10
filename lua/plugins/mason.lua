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
                },
                automatic_installation = false,
            }

            require('mason-lspconfig').setup {
                ensure_installed = {
                    'lua_ls',
                    'jsonls',
                },
                automatic_installation = false,
            }
        end,
    },
}
