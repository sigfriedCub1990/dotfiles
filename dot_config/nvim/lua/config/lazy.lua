local utils = require("config.utils")
local set = vim.opt

-- For Obsidian.nvim
set.conceallevel = 2

-- Disable initial Vim message
set.shortmess = "I"

-- Set completeopt to have a better completion experience
set.completeopt = "menu,menuone,noselect"
set.signcolumn = "yes"

-- moving around, searching and patterns
set.path = ".,**"
set.ignorecase = true
set.smartcase = true

-- tabs and indenting
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- highlight current line
set.cursorline = true

-- briefily jump to closing bracket when inserted
set.showmatch = true

-- always show tab bat at the top
set.showtabline = 2

-- relative line numbers
set.relativenumber = true

--Make line numbers default
set.number = true

--Enable break indent
set.breakindent = true

--Save undo history
set.undofile = true

--Decrease update time
set.updatetime = 250
set.signcolumn = "yes"

-- displaying text
set.scrolloff = 5
set.display = "truncate"
set.fillchars = { vert = "│" }
set.list = true
set.listchars = {
	extends = "⟩",
	nbsp = "␣",
	precedes = "⟨",
	tab = "► ",
	trail = "·",
}

-- multiple windows
set.previewheight = 5
set.splitbelow = true
set.splitright = true

-- selecting text
set.clipboard = "unnamedplus,unnamed"

-- reading and writing files
set.fileformats = "unix"
set.writebackup = false
set.autowrite = true

-- the swap file
set.swapfile = false
set.termguicolors = true

-- Change colors used by quickscope plugin
vim.cmd([[
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]])

-- Remap space as leader key
utils.add_mapping("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- edit config file
utils.add_mapping("n", "<leader>ev", ":e $MYVIMRC<CR>", { silent = false, desc = "Edit $VIMRC file" })
-- source config file
utils.add_mapping("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true, desc = "Reload $VIMRC file" })

utils.add_mapping("i", "<C-U>", "<esc>viwUA", { silent = false, desc = "Make WORD uppercase while in insert mode" })

-- Substitute
utils.add_mapping("n", "gs", ":%s/", { silent = false })

-- Splits
utils.add_mapping("n", "<leader>vs", ":vsplit<cr>", { silent = false, desc = "Split vertically" })
utils.add_mapping("n", "<leader>hs", ":split<cr>", { silent = false, desc = "Split horizontally" })

-- Reutils.add_mapping for dealing with word wrap
utils.add_mapping("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
utils.add_mapping("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Navigation
utils.add_mapping("n", "[d", "", {
	desc = "Goto previous diagnostic",
	callback = function()
		utils.goto_error("prev")
	end,
})
utils.add_mapping("n", "]d", "", {
	desc = "Goto next diagnostic",
	callback = function()
		utils.goto_error("next")
	end,
})
utils.add_mapping("n", ",,", "<C-^>", { desc = "Go to alternate file" })
utils.add_mapping("n", "<leader>w", ":w<cr>", { desc = "[W]rite file" })
utils.add_mapping("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy" })
utils.add_mapping("n", "<leader>m", ":Mason<cr>", { desc = "Open Mason" })

-- Fugitive
utils.add_mapping("n", "<leader>gg", ":G<cr>", { desc = "(Fugitive) Display Fugitive" })

-- Obsidian
utils.add_mapping("n", "<leader>oq", ":Obsidian quick_switch<cr>", { desc = "[O]bsidian [Q]uickswitch" })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "● ",
			[vim.diagnostic.severity.WARN] = "● ",
			[vim.diagnostic.severity.INFO] = "● ",
			[vim.diagnostic.severity.HINT] = "● ",
		},
	},
	severity_sort = true,
	float = { source = "if_many", border = "rounded" },
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"matchit",
			},
		},
	},
})
