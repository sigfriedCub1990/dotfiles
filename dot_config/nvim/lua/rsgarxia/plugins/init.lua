return {
	"nvim-lua/plenary.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"romainl/vim-cool",
	"unblevable/quick-scope",
	"sunaku/tmux-navigate",
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-dragon")
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
			mason_lsp.setup({
				ensure_installed = {
					"tsserver",
					"pyright",
				},
			})
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
			local lib = require("rsgarxia.lib")
			require("mini.indentscope").setup()
			require("mini.pairs").setup()
			require("mini.statusline").setup({
				content = {
					active = lib.status_line,
				},
			})
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
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader><leader>", desc = "(FZF) Search buffers" },
			{ "<leader>p", desc = "(FZF) Search files" },
			{ "<leader>ss", desc = "(FZF) Search strings" },
		},
		config = function()
			require("fzf-lua").setup({
				fzf_opts = {
					["--layout"] = "reverse-list",
				},
				files = { previewer = false },
				lsp = {
					code_actions = {
						prompt = "Code Actions> ",
						previewer = "codeaction_native",
					},
				},
			})
			vim.api.nvim_set_keymap("n", "<leader><leader>", ":FzfLua buffers<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>p", ":FzfLua files<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>ss", ":FzfLua live_grep_native<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>sl", ":FzfLua live_grep_resume<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<leader>ca", ":FzfLua lsp_code_actions<CR>", { noremap = true })
		end,
	},
}
