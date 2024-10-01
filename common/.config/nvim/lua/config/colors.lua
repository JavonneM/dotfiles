local installedThemes = { "tokyonight", "carbonfox" }
local utils = require("core.utils")

function fallbackColor()
    if utils.isMacOS() then
         return "tokyonight"
    end
    -- return "nightfox"
    return "carbonfox"
end

function Configure(color)
    color = color or fallbackColor()
    vim.api.nvim_create_autocmd("ColorScheme",{
        pattern="*",
        callback = function ()
           applyOverrides()
        end 
    })
    vim.cmd.colorscheme(color)
end

function applyOverrides()
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow' })
end

return {
    Configure=Configure
}
