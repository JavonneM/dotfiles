local dap = require('dap')
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on", "--quiet" }
}

dap.configurations.c = {
    -- compile using
    -- clang --debug 
     {
        name = "Launch - GDB",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

