return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			completion = { documentation = { auto_show = false } },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "List all the references to the symbol")
					map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "(LSP) Go to declaration")
					map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "(LSP) Go to definition")
					map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "(LSP) Go to implementation")
					map("K", "<cmd>lua vim.lsp.buf.hover()<CR>", "(LSP) Hover")
					map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "(LSP) Show signature help")
					map(
						"<leader>D",
						"<cmd>lua vim.lsp.buf.type_definition()<CR>",
						"(LSP) Jump to the definition of the type"
					)
					map("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "(LSP) Rename variable")
					map(
						"<leader>q",
						"<cmd>lua vim.diagnostic.setloclist()<CR>",
						"(LSP) Add buffer diagnostic to the location list"
					)

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			local servers = {
				clangd = {},
				ruff = {},
				bashls = {},
				dockerls = {},
				lua_ls = {},
				cssls = {},
				gopls = {},
				ts_ls = {},
				rust_analyzer = {},
				-- elmls = {},
				-- clojure_lsp = {},
				-- solargraph = {},
			}

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"ruff",
				"prettierd",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- LSP servers and clients are able to communicate to each other what features they support.
						--  By default, Neovim doesn't support everything that is in the LSP specification.
						--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
						--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
						-- local capabilities = vim.lsp.protocol.make_client_capabilities()
						-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
						local capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
