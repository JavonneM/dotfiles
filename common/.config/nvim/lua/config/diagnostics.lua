
function Configure()
    vim.keymap.set("n", "gl", function()
      vim.diagnostic.open_float(nil, { scope = "line" })
    end, { desc = "Show line diagnostics" })
end
return { Configure = Configure }
