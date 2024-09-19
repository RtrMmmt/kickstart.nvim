local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
    cmd = { "clangd" },
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    flags = {
        debounce_text_changes = 150,
    },
    -- extraArgs にインクルードパスを指定
    init_options = {
        compilationDatabaseDirectory = ".",
        extraArgs = { "-I/usr/local/Cellar/open-mpi/5.0.3_1/include" },
    }
})
