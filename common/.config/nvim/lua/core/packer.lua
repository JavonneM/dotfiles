-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Fuzzy searcher
    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Color Themes
    use "EdenEast/nightfox.nvim"
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    -- Quick file access
    -- use('theprimeagen/harpoon')
    -- Undo Tree
    use('mbbill/undotree')

    -- file explorer

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Status
    use({
        "NTBBloodbath/galaxyline.nvim",
        config = function()
          require("galaxyline.themes.eviline")
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
    -- Tabline
    -- use 'nanozuki/tabby.nvim'

    -- Git integration
    -- use('tpope/vim-fugitive')
    use('f-person/git-blame.nvim')
    use('williamboman/mason.nvim')
    -- LSP
    use 'neovim/nvim-lspconfig'
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
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
    use {
        "mfussenegger/nvim-dap",
        requires = {
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

    }
    -- Debug adapter addtional
    -- Flutter
    use {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }
    -- Node
    --[[
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    --]]
    -- lint server/wrapper
    -- use('mfussenegger/nvim-lint')
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    -- Code Snapshots
    use{
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
    }
    -- Language stuff
    use "elkowar/yuck.vim"
    if packer_bootstrap then
        require('packer').sync()
    end
end)
