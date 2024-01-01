return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb = require("telescope").extensions.file_browser
			local map = vim.api.nvim_set_keymap

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"%.git/",
						"node_modules/",
						"coverage/",
						"__pycache__/",
						"%.o",
						"client/graphql/",
					},
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
					prompt_prefix = "λ ",
					path_display = {
						shorten = { len = 1, exclude = { 1, -1 } },
					},
					-- preview = false,
					layout_strategy = "vertical",
					layout_config = {
						prompt_position = "top",
						mirror = true,
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
								["N"] = fb.actions.create,
								["h"] = fb.actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})

			telescope.load_extension("file_browser")

			vim.keymap.set("n", "<leader>fb", function()
				fb.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					hidden = false,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 80 },
				})
			end, { noremap = true })

			-- Telescope mappings
			local function add_telescope_mapping(mode, mapping, cmd, other_opts)
				local opts = { noremap = true, silent = true }
				for key, value in pairs(other_opts) do
					opts[key] = value
				end
				map(mode, mapping, cmd, opts)
			end

			add_telescope_mapping(
				"n",
				"<leader>tsb",
				"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
				{ desc = "Search current buffer" }
			)
			add_telescope_mapping(
				"n",
				"<leader>th",
				"<cmd>Telescope help_tags<CR>",
				{ desc = "Search help tags (Vim)" }
			)
			add_telescope_mapping("n", "<leader>tm", "<cmd>Telescope man_pages<CR>", { desc = "Search man pages" })
			add_telescope_mapping(
				"n",
				"<leader>tg",
				"<cmd>Telescope git_branches<CR>",
				{ desc = "Search git branches" }
			)
			add_telescope_mapping("n", "<leader>tk", "<cmd>Telescope keymaps<CR>", { desc = "Search defined keymaps" })
		end,
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
}
