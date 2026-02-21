vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = args.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = args.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach-keybinds", { clear = true }),
	callback = function(args)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		map("grr", "<cmd>FzfLua lsp_references<CR>", "List all the references to the symbol")
		map("grD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
		map("grd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
		map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
		map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help")
		map("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Jump to the definition of the type")
	end,
})

-- From @groig https://github.com/groig/nvim/blob/main/init.lua#L183
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	command = [[silent! normal! g`"zv]],
})
