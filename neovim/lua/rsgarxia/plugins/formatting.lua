return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "ruff", "black" },
			javascript = { { "prettierd" } },
			typescript = { { "prettierd" } },
			typescriptreact = { { "prettierd" } },
			javascriptreact = { { "prettierd" } },
			json = { { "prettierd" } },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 1000,
			lsp_fallback = false,
		},
	},
}
