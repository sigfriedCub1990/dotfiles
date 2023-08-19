local basepath = vim.fn.stdpath "data" .. "/lazy/"

-- Blazingly fast
collectgarbage "stop"

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    collectgarbage "restart"
  end,
  once = true,
})

local function ensure(pkg)
  local pkg_name = pkg:match "[^/]*$"
  local pkg_path = basepath .. pkg_name
  if vim.fn.empty(vim.fn.glob(pkg_path)) > 0 then
    vim.pretty_print(("Installing %s to %s"):format(pkg, pkg_path))
    vim.fn.system { "git", "clone", "https://github.com/" .. pkg, pkg_path }
    -- vim.cmd('packadd ' .. pkg_name)
  end
  vim.opt.rtp:prepend(pkg_path)
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "Briefly highlight yanked text"
})

ensure "folke/lazy.nvim"
require "rsgarxia.init"
