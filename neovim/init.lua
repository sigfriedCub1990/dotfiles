require("impatient")

vim.o.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

require("globals")
require("base")
require("maps")
require("plugins")

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "Briefly highlight yanked text"
})
