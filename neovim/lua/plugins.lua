local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
    -- common
    use("nvim-lua/plenary.nvim")

    -- plugin manager and optimizations
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")

    -- Pope's commandments
    use("tpope/vim-fugitive")
    use("tpope/vim-commentary")
    use("tpope/vim-surround")

    -- UI to select things (files, grep results, open buffers...)
    use("nvim-telescope/telescope.nvim")

    -- theming neovim
    use("itchyny/lightline.vim")
    use("ellisonleao/gruvbox.nvim")

    -- tags management
    use("ludovicchabant/vim-gutentags")

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- lsp stuff
    use("onsails/lspkind-nvim")
    use("ray-x/lsp_signature.nvim")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("saadparwaiz1/cmp_luasnip")

    -- searching
    use("junegunn/fzf")
    use("junegunn/fzf.vim")

    -- snippets
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use("rafamadriz/friendly-snippets")

    -- misc
    use("jiangmiao/auto-pairs")
    use("lewis6991/gitsigns.nvim")
    use("dhruvasagar/vim-table-mode")
    use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
    use("jose-elias-alvarez/null-ls.nvim")
end)

require("impatient")
