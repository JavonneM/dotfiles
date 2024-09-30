function Configure()
    vim.keymap.set('n', '<F5>',
        function() require('dap').continue() end,
        { desc = 'DAP - Run or Continue' }
    )
    vim.keymap.set('n', '<F10>',
        function() require('dap').step_over() end,
        { desc = 'DAP - Step Over' }
    )
    vim.keymap.set('n', '<F11>',
        function() require('dap').step_into() end,
        { desc = 'DAP - Step Into' }
    )
    vim.keymap.set('n', '<F12>',
        function() require('dap').step_out() end,
        { desc = 'DAP - Step Out' }
    )
    vim.keymap.set('n', '<Leader>b',
        function() require('dap').toggle_breakpoint() end,
        { desc = 'DAP - Toggle [b]reakpoint' }
    )
    vim.keymap.set('n', '<Leader>B',
        function()
            require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        { desc = 'DAP - Set condition [B]reakpoint' }
    )
    vim.keymap.set('n', '<Leader>lp',
        function()
            require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        { desc = 'DAP - [L]og [p]oint message' }
    )
    vim.keymap.set('n', '<Leader>dr',
        function() require('dap').repl.open() end,
        { desc = 'DAP - Open [R]EPL' }
    )
    vim.keymap.set('n', '<Leader>dl',
        function() require('dap').run_last() end,
        { desc = '[D]AP - Run [l]ast' }

    )
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh',
        function()
            require('dap.ui.widgets').hover()
        end,
        { desc = '[D]AP - [h]over' }
    )
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp',
        function()
            require('dap.ui.widgets').preview()
        end,
        { desc = '[D]AP - [p]review' }
    )
    vim.keymap.set('n', '<Leader>df',
        function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end,
        { desc = '[D]AP - Show [f]rames' }
    )
    vim.keymap.set('n', '<Leader>ds',
        function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end,

        { desc = '[D]AP - Show [s]copes ' }
    )
    vim.keymap.set('n', '<Leader>td',
        function ()
           require('dap-go').debug_test()
        end,
        { desc = '[D]AP - Debug test ' }
    )
    --[[
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
--]]
end

return { Configure = Configure }
