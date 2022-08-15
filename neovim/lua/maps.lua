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
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map(
    "n",
    "<leader>sf",
    [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
    { noremap = true, silent = true }
)
map(
    "n",
    "<leader>sb",
    [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
    { noremap = true, silent = true }
)
map("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map(
    "n",
    "<leader>so",
    [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
    { noremap = true, silent = true }
)
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- FZF maps
map("n", "<leader>p", ":Files<CR>", { noremap = true })
map("n", "<leader>t", ":Tags<CR>", { noremap = true })
map("n", "<leader>b", ":Buffers<CR>", { noremap = true })
