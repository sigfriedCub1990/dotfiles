local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- edit config file
map("n", "<leader>ev", ":e $MYVIMRC<CR>", { noremap = true })
-- source config file
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true })

map("i", "<C-U>", "<esc>viwUA", { noremap = true })

-- clear search highlights
map("n", "<leader>/", ":nohlsearch<cr>", { noremap = true })

-- Substitute
map("n", "gs", ":%s/", { noremap = true })

-- Splits
map("n", "<leader>vs", ":vsplit<cr>", { noremap = true })
map("n", "<leader>hs", ":split<cr>", { noremap = true })

-- Buffers (evil like maps)
map("n", "<leader>bs", ":w<cr>", { noremap = true })
map("n", "<leader>bd", ":bd<cr>", { noremap = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

