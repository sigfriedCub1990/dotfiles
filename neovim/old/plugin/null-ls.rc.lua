local status, null_ls = pcall(require, "null-ls")
if not status then
    return "null-ls not installed"
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

-- Disable tsserver formating capabilities
local custom_format = function(bufnr)
    vim.lsp.buf.format({
        bufnr = bufnr,
        filter = function(client)
            return client.name ~= "tsserver"
        end,
        timeout_ms = 2000
    })
end

local augroup_format = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local format_on_save = function(bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function() custom_format(bufnr) end,
  })
end

null_ls.setup({
    -- debug = true,
    sources = {
        -- Linters
        diagnostics.eslint.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
            prefer_local = "node_modules/.bin"
        }),
        diagnostics.ruff,
        diagnostics.rubocop.with({
            diagnostics_format = "[rubocop] #{m}\n(#{c})",
        }),
        -- Formatters
        formatting.shfmt,
        formatting.prettier,
        formatting.black,
        formatting.rubocop,
        -- Code Actions
        code_actions.eslint
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
          format_on_save(bufnr)
        end
      end,
})
