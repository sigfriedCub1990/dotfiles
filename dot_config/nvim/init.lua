require("config.lazy")
require("config.autocommands")

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.enable({ "basedpyright", "luals", "clangd", "ts_ls", "dockerls", "bashls", "cssls" })
