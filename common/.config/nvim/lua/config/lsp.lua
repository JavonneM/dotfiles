function Configure()
    local style = '{border = "rounded"}'
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {
        desc = 'LSP - [G]o to [D]efinition',
    })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover('..style..')<cr>', {
        desc = 'LSP - Show info'
    })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition(' ..style..')<cr>', {
        desc = 'LSP - [G]o to [D]efinition'
    })
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {
        desc = 'LSP - [G]o to [D]eclaration'
    })
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {
        desc = 'LSP - [G]o to [I]mplemention'
    })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {
        desc = 'LSP - Show [G-I]mplemention'
    })
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {
        desc = 'LSP - Show [G-I]mplemention'
    })
    vim.keymap.set('n', 'cr', '<cmd>lua vim.lsp.buf.rename()<cr>', {
        desc = 'LSP - Show [G-I]mplemention'
    })
    vim.keymap.set('n', 'cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {
        desc = 'LSP - [C]ode [F]ormat'
    })
    vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', {
        desc = 'LSP - [C]ode [A]ction'
    })


    -- Something to do with omnifunc
    -- vim.keymap.set('i', '<c-tab>', function()
    --     vim.lsp.completion.get()
    -- end)

    -- Set autocomplete behaviour
    -- vim.o.completeopt = "menu,menuone,noselect,preview"
    vim.o.completeopt = "menu,menuone,noselect"

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client ~= nil and client:supports_method "textDocument/completion" then
          -- Default triggerCharacters is dot only { "." }
          -- Trigger autocompletion on EVERY letter. May be slow!
          client.server_capabilities.completionProvider.triggerCharacters =
            vim.split(".abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", "", true)
          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
      end,
    })

    -- Need to enable this in the language servers
    -- vim.keymap.set("n","<leader>lh", function()
    --         vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    -- end, { desc = "Toggle inlay hints"})


    vim.keymap.set("i", "<Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
    end, { expr = true })
    vim.keymap.set("i", "<S-Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
    end, { expr = true })
    vim.keymap.set("i", "<CR>", function()
      return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
    end, { expr = true })
end

return { Configure = Configure }
