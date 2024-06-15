local prettierd_compatible = {
	"typescript",
	"typescriptreact",
	"javascript",
	"javascriptreact",
	"svelte",
	"vue",
	"css",
	"scss",
	"less",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"graphql",
	"handlebars",
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = function(_, opts)
		opts.formatters_by_ft = opts.formatters_by_ft or {}
		for _, ft in ipairs(prettierd_compatible) do
			opts.formatters_by_ft[ft] = { "prettierd" }
		end
		opts.formatters_by_ft["python"] = { "ruff_format" }
		opts.formatters_by_ft["lua"] = { "stylua" }

		opts.format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = false,
		}
	end,
}
