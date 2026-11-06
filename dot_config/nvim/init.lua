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

vim.lsp.enable({
	"clangd",
	"basedpyright",
	"luals",
	"ts_ls",
	"dockerls",
	"bashls",
	"cssls",
	"ruff",
	"elixir",
})
