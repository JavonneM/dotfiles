local dap_virtual_text = require("nvim-dap-virtual-text")
local dapui, dap = require("dapui"), require("dap")

dap_virtual_text.setup()
dapui.setup()

-- hooks to open dap ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Load init.lua in project dir
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local cwd = vim.fn.expand('%:p:h')
        local config = cwd .. '/nvim_dap_config.lua'
        local utils = require('core.utils')
        if utils.file_exists(config) then
            vim.cmd('luafile ' .. config)
        else
            print('No dap configuration found, ' .. config .. ' does not exist')
        end
    end
})
