function Configure()
    local lsp = require('lsp-zero')
    -- lsp.preset('recommended')
    lsp.preset({
        name = 'recommended',
        set_lsp_keymaps = true
    })
    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        lsp.buffer_autoformat()
    end)
    lsp.setup()
    require('lspconfig').lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })

    vim.keymap.set('n', '<F3>',
        vim.lsp.buf.format,
        { desc = 'LSP - Format code' }
    )
end

return { Configure = Configure }
