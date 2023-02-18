local status, telescope = pcall(require, "telescope")
if not status then
    return
end

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local map = vim.api.nvim_set_keymap
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
            },
        },
        prompt_prefix = "λ ",
        path_display = {
            shorten = { len = 1, exclude = { 1, -1 } },
        },
        preview = false,
        color_devicons = false,
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

vim.keymap.set("n", "tb", function()
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

-- Telescope mappings
function add_telescope_mapping(mode, mapping, cmd, other_opts)
    local opts = { noremap = true, silent = true }
    for key, value in pairs(other_opts) do
        opts[key] = value
    end
    map(mode, mapping, cmd, opts)
end

add_telescope_mapping(
    "n",
    "<leader><leader>",
    "<cmd>lua require('telescope.builtin').buffers()<CR>",
    { desc = "Search open buffers" }
)
add_telescope_mapping(
    "n",
    "<leader>sb",
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    { desc = "Search current buffer" }
)
add_telescope_mapping("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags (Vim)" })
add_telescope_mapping("n", "<leader>ss", "<cmd>Telescope grep_string<CR>", { desc = "Grep string" })
add_telescope_mapping("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", { desc = "Search man pages" })
add_telescope_mapping("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Search git branches" })
add_telescope_mapping("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Search define keymaps" })
add_telescope_mapping("n", "<leader>p", "<cmd>Telescope find_files<CR>", { desc = "Search files" })
