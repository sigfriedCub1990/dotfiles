local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- edit config file
map("n", "<leader>v", ":e ~/.config/nvim/init.lua<CR>", { noremap = true })

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

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Add leader shortcuts
local opts = { noremap = true, silent = true }
map("n", "<leader><space>", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
map("n", "<leader>so", "<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>", opts)
map("n", "<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>st", "<cmd>Telescope tags<CR>", opts)
map("n", "<leader>sd", "<cmd>Telescope grep_string<CR>", opts)
map("n", "<leader>sp", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)

map("n", "<leader>p", "<cmd>Telescope find_files<CR>", { noremap = true })
