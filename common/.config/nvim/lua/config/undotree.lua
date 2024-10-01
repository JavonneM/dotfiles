function Configure()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return { Configure=Configure}
