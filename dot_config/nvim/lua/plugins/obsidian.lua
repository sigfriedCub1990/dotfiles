return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Alexandria/*.md",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/Documents/Alexandria"
            }
        }
  },
}
