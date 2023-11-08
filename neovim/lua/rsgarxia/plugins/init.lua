return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-fugitive",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "romainl/vim-cool",
    "unblevable/quick-scope",
    "dhruvasagar/vim-table-mode",
    "sunaku/tmux-navigate",
    "nvim-tree/nvim-web-devicons",
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
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" }
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            local colorizer = require("colorizer")
            colorizer.setup()
        end
    },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.indentscope').setup()
            require('mini.pairs').setup()
            require('mini.statusline').setup()
            require('mini.cursorword').setup()
            require('mini.starter').setup()
        end
    },
}
