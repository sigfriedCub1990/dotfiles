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
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local mason = require("mason")
			local mason_lsp = require("mason-lspconfig")

			mason.setup()
			mason_lsp.setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			local colorizer = require("colorizer")
			colorizer.setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "BufReadPost",
		config = function()
			require("mini.indentscope").setup()
			require("mini.pairs").setup()
			require("mini.statusline").setup()
			require("mini.cursorword").setup()
			require("mini.starter").setup()
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufReadPost",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		keys = {
			{ "<leader><leader>", desc = "(FZF) Search buffers" },
			{ "<leader>p", desc = "(FZF) Search files" },
			{ "<leader>ss", desc = "(FZF) Search strings" },
		},
		config = function()
			vim.g["fzf_layout"] = { down = "50%" }
			vim.api.nvim_set_keymap("n", "<leader><leader>", ":Buffers<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>p", ":Files<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>ss", ":RG<CR>", { noremap = true })
		end,
	},
}
