function Configure()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
end

return { Configure=Configure}
