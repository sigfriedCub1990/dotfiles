local status, null_ls = pcall(require, "null-ls")
if not status then
    return "null-ls not installed"
end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup({
    -- debug = true,
    sources = {
        null_ls.builtins.diagnostics.eslint.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
        }),
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup_format,
            buffer = 0,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
          })
        end
      end,
})
