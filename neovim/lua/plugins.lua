local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

vim.cmd([[packadd packer.nvim]])
vim.cmd([[
    let g:vimtex_view_method='zathura'
]])

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
    use("tpope/vim-repeat")

    -- UI to select things (files, grep results, open buffers...)
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- lsp stuff
    use("ray-x/lsp_signature.nvim")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- autocompletion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            -- Completion sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            -- Complements
            "onsails/lspkind-nvim"
        }
    })

    -- searching
    -- Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- snippets
    use("L3MON4D3/LuaSnip") -- Snippets plugin
    use("rafamadriz/friendly-snippets")

    -- colorize css
    use("norcalli/nvim-colorizer.lua")

    -- csv manipulation
    use("chrisbra/csv.vim")

    -- integrate tmux & (n)vim
    use("sunaku/tmux-navigate")

    -- misc
    use("jiangmiao/auto-pairs")
    use("lewis6991/gitsigns.nvim")
    use("dhruvasagar/vim-table-mode")
    use("jose-elias-alvarez/null-ls.nvim")
    use("lervag/vimtex")
    use("tommcdo/vim-exchange")
    use {
        "j-hui/fidget.nvim",
        tag = "legacy"
    }
    use("folke/neodev.nvim")
    use("romainl/vim-cool")
    -- Clojure REPL
    use("Olical/conjure")
    use("tpope/vim-dispatch")
    use("clojure-vim/vim-jack-in")
    use("radenling/vim-dispatch-neovim")
    use("folke/tokyonight.nvim")
end)
