function Configure()
    vim.keymap.set('v', '<leader>sc', '<Cmd>Silicon<CR>',
        { desc = '[s]creenshot [c]ode' }
    )
end
return {Configure=Configure}
