require("mini.statusline")

local M = {}

function M.scrollbar()
	local width = 9
	local perc = (vim.fn.line(".") - 1.0) / (math.max(vim.fn.line("$"), 2) - 1.0)
	local before = vim.fn.float2nr(vim.fn.round(perc * (width - 3)))
	local after = width - 3 - before

	return string.format("[%s%s%s]", string.rep(" ", before), "=", string.rep(" ", after))
end

function M.status_line()
	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	local git = MiniStatusline.section_git({ trunc_width = 75 })
	local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
	local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
	local location = MiniStatusline.section_location({ trunc_width = 75 })
	local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
	local scroll = M.scrollbar()

	return MiniStatusline.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { filename } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFileinfo", strings = { scroll } },
		{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
		{ hl = mode_hl, strings = { search, location } },
	})
end

return M
