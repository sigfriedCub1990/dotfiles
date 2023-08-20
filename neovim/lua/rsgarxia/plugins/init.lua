return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "romainl/vim-cool",
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local mason = require("mason")
            local mason_lsp = require("mason-lspconfig")

            mason.setup()
            mason_lsp.setup()
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd.colorscheme "tokyonight"
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" }
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            local fidget = require("fidget")
            fidget.setup({
                text = {
                    spinner = "moon",
                    done = "🗸",
                },
                timer = {
                    spinner_rate = 150,
                },
                sources = {
                    ["null-ls"] = {
                        ignore = true,
                    },
                },
                window = {
                    blend = 0,
                },
            })
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            local colorizer = require("colorizer")
            colorizer.setup()
        end
    }
}
