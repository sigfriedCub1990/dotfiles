return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "<leader>ht", "<cmd>Gtisigns toggle_current_line_blame")
			map({ "n", "v" }, "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
			map({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
			map("n", "<leader>hn", "<cmd>Gitsign next_hunk<CR>")
			map("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>")
			map("n", "<leader>gb", ":FzfLua git_branches<CR>")
		end,
	},
}
