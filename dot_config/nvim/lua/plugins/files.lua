return {
	"stevearc/oil.nvim",
	opts = function()
		vim.keymap.set("n", "<leader>fb", ":Oil<CR>", {
			desc = "Open [F]ile [Browser]",
			noremap = true,
		})

		return {
			skip_confirm_for_simple_edits = true,
		}
	end,
}
