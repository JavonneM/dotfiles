-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
    -- Fuzzy searcher
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- Color Themes
    "EdenEast/nightfox.nvim",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        opts = function(_, opts)
            -- opts.ignore_install = { "help" }
            -- opts.ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' }
        end,
    },
    'nvim-treesitter/playground',
    -- Quick file access
    -- (theprimeagen/harpoon')
    -- Undo Tree
    'mbbill/undotree',

    -- file explorer

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    -- Status
    {
        "NTBBloodbath/galaxyline.nvim",
        config = function()
            require("galaxyline.themes.eviline")
        end,
        dependencies = { "kyazdani42/nvim-web-devicons", opt = true }
    },
    -- Tabline
    --  'nanozuki/tabby.nvim'

    -- Git integration
    -- (tpope/vim-fugitive')
    'f-person/git-blame.nvim',
    'williamboman/mason.nvim',
    -- LSP
    'neovim/nvim-lspconfig',
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    --  {
    --     'VonHeikemen/lsp-zero.nvim',
    --     dependencies = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },

    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },

    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }
    -- Debug adapter plugin
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text", -- shows test = "string" during debug
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "nvim-telescope/telescope-dap.nvim",
            "jbyuki/one-small-step-for-vimkind",
            -- adapters
            --"mxsdev/nvim-dap-vscode-js",
            "leoluz/nvim-dap-go",
            "mfussenegger/nvim-dap-python",
        },

    },
    -- Debug adapter addtional
    -- Flutter
    {
        'akinsho/flutter-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    },
    -- LLM
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- Node
    --[[
     {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    --]]
    -- lint server/wrapper
    -- (mfussenegger/nvim-lint')
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    -- Code Snapshots
    {
        "michaelrommel/nvim-silicon",
        cmd = "Silicon",
        config = function()
            local font = "FiraCode Nerd Font Mono=24"
            local utils = require("core.utils")
            if utils.isMacOS() then
                font = "FiraCode Nerd Font Mono=24"
            end
            require("nvim-silicon").setup({
                font = font,
                output = function()
                    return "~/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
                end
            })
        end
    },
    -- Language stuff
    "elkowar/yuck.vim",
}
local opts = {}
require("lazy").setup(plugins, opts)
