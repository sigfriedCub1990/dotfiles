local utils = require("rsgarxia.utils")

--Remap space as leader key
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

utils.add_mapping(
	"n",
	"<leader>e",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ nowait = true, desc = "Open diagnostics in float window" }
)

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
utils.add_mapping("n", "<leader>o", ":only<cr>", { desc = "Only display current buffer" })

-- Fugitive
utils.add_mapping("n", "<leader>g", ":G<cr>", { desc = "(Fugitive) Display Fugitive" })
