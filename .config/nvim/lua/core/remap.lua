--[[ Remap stuff here ]] --
--[[
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--]]
--[[
if has("unnamedplus")
then
    vim.opt.clipboard = 'unnamedplus'
else
    vim.opt.clipboard = 'unnamed'
end
--]]
-- System copy + paste remapped to ctrl+ shift + c/v

--noremap <Ctrl + Shift + v> "+p
--noremap <Ctrl + Shift + v> "+c
--vim.keymap.set("n", "<C-k>", "\"+y")
--vim.keymap.set("n", "<C-S-v>", "\"+p")
