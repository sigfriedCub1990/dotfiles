require("globals")
require("base")
require("maps")
require("plugins")

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

vim.cmd([[
    autocmd VimEnter * :Files
]])
