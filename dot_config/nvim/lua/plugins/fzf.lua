return {
	"ibhagwan/fzf-lua",
	keys = {
		{ "<leader><leader>", desc = "Buffers" },
		{ "<leader>p", desc = "Files" },
		{ "<leader>ss", desc = "Grep files" },
		{ "<leader>ca", desc = "Code actions" },
		{ "<leader>gr", desc = "Go to References" },
	},
	opts = function(_, opts)
		local map = require("config.utils").map
		local fzf_lua = require("fzf-lua")

		map("<leader><leader>", fzf_lua.buffers, "List open buffers")
		map("<leader>p", fzf_lua.files, "Search files across project")
		map("<leader>ss", fzf_lua.live_grep_native, "[S]earch [s]string across project")
		map("<leader>sl", fzf_lua.live_grep_resume, "[S]earch [l]ast pattern")
		map("<leader>sh", fzf_lua.helptags, "[S]earch [h]elp")
		map("<leader>sm", fzf_lua.manpages, "[S]earch [m]an pages")
		map("<leader>sw", fzf_lua.grep_cword, "[S]earch [w]ord under the cursor")
		map("<leader>ca", fzf_lua.lsp_code_actions, "[C]ode [a]ctions")
		map("<leader>gr", fzf_lua.lsp_references, "[G]o to [R]eferences")

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
