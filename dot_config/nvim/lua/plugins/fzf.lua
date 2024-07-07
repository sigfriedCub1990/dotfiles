return {
	"ibhagwan/fzf-lua",
	keys = {
		{ "<leader><leader>", desc = "Buffers" },
		{ "<leader>p", desc = "Files" },
		{ "<leader>ss", desc = "Grep files" },
		{ "<leader>ca", desc = "Code actions" },
	},
	opts = function(_, opts)
		local map = require("config.utils").map
		map("<leader><leader>", require("fzf-lua").buffers, "List open buffers")
		map("<leader>p", require("fzf-lua").files, "Search files across project")
		map("<leader>ss", require("fzf-lua").live_grep_native, "[S]earch [s]string across project")
		map("<leader>sl", require("fzf-lua").live_grep_resume, "[S]earch [l]ast pattern")
		map("<leader>sh", require("fzf-lua").helptags, "[S]earch [h]elp")
		map("<leader>sm", require("fzf-lua").manpages, "[S]earch [m]an pages")
		map("<leader>sw", require("fzf-lua").grep_cword, "[S]earch [w]ord under the cursor")
		map("<leader>ca", require("fzf-lua").lsp_code_actions, "[C]ode [a]ctions")

		return vim.tbl_deep_extend("force", opts, {
			fzf_opts = {
				["--layout"] = "reverse-list",
				["--cycle"] = true,
			},
			files = { previewer = false },
			lsp = {
				code_actions = {
					prompt = "Code Actions> ",
					previewer = "codeaction_native",
				},
			},
		})
	end,
}
