local utils = require("core.utils")


function Configure()
    if utils.isMacOS() or utils.isLinux() then
        vim.opt.clipboard = "unnamedplus"
    elseif utils.isWindows() then
        vim.opt.clipboard = "unnamed"
    end
end
Configure()
