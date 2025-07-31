function SetupLLMs()
    require("codecompanion").setup({
        strategies = {
            chat = {
                keymaps = {
                    send = {
                        modes = { i = '<Enter>' }
                    }
                }
            }
        },
        -- adapters = {
        --     openai = function()
        --         return require("codecompanion.adapters").extend("openai", {
        --             env = {
        --                 api_key = "cmd:cat ~/.config/nvim/openai.key"
        --             },
        --             schema = {
        --                 model = {
        --                     default = "gpt-4.1",
        --                 },
        --             },
        --         })
        --     end,
        -- },
    })
end

function Configure()
    SetupLLMs()
end

return {
    Configure = Configure
}
