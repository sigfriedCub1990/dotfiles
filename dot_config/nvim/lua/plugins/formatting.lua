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
		-- Increase logging level
		opts.log_level = vim.log.levels.DEBUG

		opts.formatters_by_ft = opts.formatters_by_ft or {}
		opts.formatters = opts.formatters or {}

		opts.formatters_by_ft = {
			python = { "ruff_format" },
			lua = { "stylua" },
			c = { "clang-format" },
		}
		opts.formatters["clang-format"] = {
			append_args = {
				"--style=mozilla",
				"--sort-includes",
			},
		}

		-- File formats suported by Prettier
		for _, ft in ipairs(prettierd_compatible) do
			opts.formatters_by_ft[ft] = { "prettierd" }
		end

		opts.format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = false,
		}
	end,
}
