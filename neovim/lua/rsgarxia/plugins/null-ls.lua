return {
    "mskelton/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    opts = function()
      local nls = require "null-ls"
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

      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint.with({
              diagnostics_format = "[eslint] #{m}\n(#{c})",
              prefer_local = "node_modules/.bin"
          }),
          nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.ruff,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.rubocop.with({
              diagnostics_format = "[rubocop] #{m}\n(#{c})",
          }),
        },
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
            format_on_save(bufnr)
          end
        end
      }
    end,
 }

