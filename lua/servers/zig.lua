-- local ZLS_PATH = os.getenv 'ZLS_PATH'
-- local ZLS_EXE = ''
-- -- Check if OS is windows
-- if vim.fn.has 'win32' == 1 then
--     ZLS_EXE = ZLS_PATH .. '/zls.exe'
-- else
--     ZLS_EXE = ZLS_PATH .. '/zls'
-- end

require('lspconfig').zls.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    filetypes = { 'zig' },
}
