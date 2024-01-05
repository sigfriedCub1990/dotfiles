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
add_mapping("n", "<leader>ev", ":e $MYVIMRC<CR>", { silent = false, desc = "Edit $VIMRC file" })
-- source config file
add_mapping("n", "<leader>sv", ":source $MYVIMRC<CR>", { silent = true, desc = "Reload $VIMRC file" })

add_mapping("i", "<C-U>", "<esc>viwUA", { silent = false, desc = "Make WORD uppercase while in insert mode" })

-- Substitute
add_mapping("n", "gs", ":%s/", { silent = false })

-- Splits
add_mapping("n", "<leader>vs", ":vsplit<cr>", { silent = false, desc = 'Split vertically' })
add_mapping("n", "<leader>hs", ":split<cr>", { silent = false, desc = 'Split horizontally' })

-- Readd_mapping for dealing with word wrap
add_mapping("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
add_mapping("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

add_mapping("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { nowait = true, desc = "Open diagnostics in float window" })

-- Navigation
add_mapping("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Goto previous diagnostic" })
add_mapping("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Goto next diagnostic" })
add_mapping("n", ",,", "<C-^>", { desc = "Go to alternate file" })
add_mapping("n", "<leader>o", ":only<cr>", { desc = "Only display current buffer" })


-- Fugitive
add_mapping("n", "<leader>g", ":G<cr>", { desc = "(Fugitive) Display Fugitive" })

vim.keymap.set({"n", "i", "s"}, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set({"n", "i", "s"}, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })
