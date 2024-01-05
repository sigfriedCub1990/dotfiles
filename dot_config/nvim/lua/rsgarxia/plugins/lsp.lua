return {
	"folke/neodev.nvim",
	{
		"neovim/nvim-lspconfig",
		dependencies = { "ray-x/lsp_signature.nvim" },
		config = function()
			require("neodev").setup({}) -- Inject lua stuff
			local lsp_signature = require("lsp_signature")
			local protocol = require("vim.lsp.protocol")

			lsp_signature.setup({
				bind = true,
				floating_window_above_cur_line = true,
				hint_enable = false,
				handler_opts = { border = "none" },
			})

			local function get_filename(str)
				local split = vim.split(str, "/")
				local length = #split

				return split[length]
			end

			local function remove_same_file_references(options, current_file)
				local ids = {}

				for i, v in ipairs(options.items) do
					if get_filename(v.filename) == current_file then
						table.insert(ids, 1, i)
					end
				end

				for _, val in pairs(ids) do
					table.remove(options.items, val)
				end

				return options
			end

			local function on_list(options)
				local current_file = get_filename(options.context.params.textDocument.uri)

				local items = remove_same_file_references(options, current_file)

				vim.fn.setloclist(0, {}, " ", items)
				require("telescope.builtin").loclist({
					trim_text = true,
				})
			end

			-- local function refs()
			--   vim.lsp.buf.references(nil, { on_list = on_list })
			-- end

			local function on_attach(_, bufnr)
				local function buf_set_keymap(mode, mapping, cmd, other_opts)
					local opts = { noremap = true, silent = true }
					for key, value in pairs(other_opts) do
						opts[key] = value
					end
					vim.api.nvim_buf_set_keymap(bufnr, mode, mapping, cmd, opts)
				end

				buf_set_keymap("n", "gr", "", {
					desc = "(LSP) List all the references to the symbol",
					callback = function()
						vim.lsp.buf.references(nil, { on_list = on_list })
					end,
				})
				buf_set_keymap(
					"n",
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<CR>",
					{ desc = "(LSP) Go to declaration" }
				)
				buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "(LSP) Go to definition" })
				buf_set_keymap(
					"n",
					"gi",
					"<cmd>lua vim.lsp.buf.implementation()<CR>",
					{ desc = "(LSP) Go to implementation" }
				)
				buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "(LSP) Hover" })
				buf_set_keymap(
					"n",
					"<C-k>",
					"<cmd>lua vim.lsp.buf.signature_help()<CR>",
					{ desc = "(LSP) Show signature help" }
				)
				buf_set_keymap(
					"n",
					"<leader>D",
					"<cmd>lua vim.lsp.buf.type_definition()<CR>",
					{ desc = "(LSP) Jump to the definition of the type" }
				)
				buf_set_keymap(
					"n",
					"<leader>rn",
					"<cmd>lua vim.lsp.buf.rename()<CR>",
					{ desc = "(LSP) Rename variable" }
				)
				buf_set_keymap(
					"n",
					"<leader>ca",
					"<cmd>lua vim.lsp.buf.code_action()<CR>",
					{ desc = "(LSP) Select a code action available for the current position" }
				)
				buf_set_keymap(
					"n",
					"<leader>q",
					"<cmd>lua vim.diagnostic.setloclist()<CR>",
					{ desc = "(LSP) Add buffer diagnostic to the location list" }
				)
			end

			-- Set up completion using nvim_cmp with LSP source
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local clients =
				{ "clangd", "pyright", "elmls", "tsserver", "bashls", "dockerls", "astro", "erlangls", "clojure_lsp" }
			for _, client in ipairs(clients) do
				if client == "tsserver" then
					lspconfig[client].setup({
						on_attach = on_attach,
						filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
						cmd = { "typescript-language-server", "--stdio" },
						capabilities = capabilities,
					})
				else
					lspconfig[client].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end
			end

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.solargraph.setup({
				on_attach = on_attach,
				settings = {
					solargraph = {
						-- Use this to deactivate diagnostics completely and
						-- to not collide with Rubocop or create a .solargraph.yaml
						-- with a Rubocop reporter.
						diagnostics = false,
					},
				},
			})

			-- Diagnostic symbols in the sign column (gutter)
			local signs = { Error = "⚫", Warn = "⚫", Hint = "⚫", Info = "⚫" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
}
