local map = vim.api.nvim_set_keymap


local function add_mapping(mode, mapping, cmd, other_opts)
    local default_opts = { noremap = true, silent = true }
    if other_opts then
        for key, value in pairs(other_opts) do
            default_opts[key] = value
        end
    end

    map(mode, mapping, cmd, default_opts)
end

--Remap space as leader key
add_mapping("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- edit config file
add_mapping("n", "<leader>ev", ":e $MYVIMRC<CR>", { silent = false })
-- source config file
add_mapping("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true })

add_mapping("i", "<C-U>", "<esc>viwUA", { silent = false })

-- clear search highlights
add_mapping("n", "<leader>/", ":nohlsearch<cr>", { silent = false })

-- Substitute
add_mapping("n", "gs", ":%s/", { silent = false })

-- Splits
add_mapping("n", "<leader>vs", ":vsplit<cr>", { silent = false })
add_mapping("n", "<leader>hs", ":split<cr>", { silent = false })

-- Readd_mapping for dealing with word wrap
add_mapping("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
add_mapping("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

add_mapping("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { nowait = true })
add_mapping("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
add_mapping("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
