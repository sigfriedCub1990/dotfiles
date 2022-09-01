local status, telescope = pcall(require, "telescope")
if not status then
    return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function()
                        vim.cmd("normal vbd")
                    end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd("startinsert")
                    end,
                },
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")

vim.keymap.set("n", "sf", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 80 },
    })
end)
