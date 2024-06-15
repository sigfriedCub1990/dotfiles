local map = vim.api.nvim_set_keymap

local M = {}

function M.add_mapping(mode, mapping, cmd, other_opts)
	local default_opts = { noremap = true, silent = true }
	if other_opts then
		for key, value in pairs(other_opts) do
			default_opts[key] = value
		end
	end

	map(mode, mapping, cmd, default_opts)
end

function M.goto_error(type)
	-- code
	if type == "next" then
		vim.diagnostic.goto_next()
	end

	if type == "prev" then
		vim.diagnostic.goto_prev()
	end
end

function M.copy_file_path()
	local file_path = vim.fn.getreg("%")
	vim.fn.setreg("+", file_path)
end

return M
