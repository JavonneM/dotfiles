function Configure()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff',
    builtin.find_files,
        { desc = 'Telescope - [f]ind [f]iles' }
    )
    vim.keymap.set('n', '<leader>gs',
    builtin.git_files,
        { desc = 'Telescope - [g]it [s]earch' }
    )
    vim.keymap.set('n', '<leader>gg',
    builtin.live_grep,
        { desc = 'Telescope - [g]it [g]rep' }
    )
    vim.keymap.set('n', '<leader>ss',
    builtin.treesitter,
        { desc = 'Telescope - [s]earch [s]ymbols' }
    )
    vim.keymap.set('n', '<leader>bs',
    builtin.buffers,
        { desc = 'Telescope - [b]uffer [s]earch' }
    )

    vim.keymap.set('n', '<leader>gb',
    builtin.git_branches,
        { desc = 'Telescope - [g]it [b]ranches' }
    )

    vim.keymap.set('n', '<leader>ts',
    builtin.colorscheme,
        { desc = 'Telescope - [t]heme [s]witcher' }
    )

    vim.keymap.set('n', '<leader>dd',
    builtin.diagnostics,
        { desc = 'Telescope - [d]iagnostics' }
    )
end
return { Configure=Configure}
