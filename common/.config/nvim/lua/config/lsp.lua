function Configure()
    vim.keymap.set('n', '<F3>',
        vim.lsp.buf.format,
        { desc = 'LSP - Format code' }
    )
end

return { Configure = Configure }
