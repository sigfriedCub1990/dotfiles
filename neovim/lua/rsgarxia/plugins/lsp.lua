return {
    "folke/neodev.nvim",
    {
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
     },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "ray-x/lsp_signature.nvim" },
        config = function()
            require("neodev").setup {} -- Inject lua stuff
            local lsp_signature = require("lsp_signature")
            local protocol = require("vim.lsp.protocol")

            lsp_signature.setup({
                bind = true,
                floating_window_above_cur_line = true,
                hint_enable = false,
                handler_opts = { border = "none" },
            })

            local function on_attach(_, bufnr)
                local function buf_set_keymap(mode, mapping, cmd, other_opts)
                    local opts = { noremap = true, silent = true }
                    for key, value in pairs(other_opts) do
                        opts[key] = value
                    end
                    vim.api.nvim_buf_set_keymap(bufnr, mode, mapping, cmd, opts)
                end

                buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",  { desc = "Go to declaration" })
                buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
                buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
                buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
                buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })
                buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Jump to the definition of the type" })
                buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename variable" })
                buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "List all the references to the symbol" })
                buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Select a code action available for the current position" })
                buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Add buffer diagnostic to the location list" })
            end

            -- Set up completion using nvim_cmp with LSP source
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            local clients = { "clangd", "pyright", "elmls", "tsserver", "bashls", "dockerls", "astro", "erlangls", "clojure_lsp" }
            for _, client in ipairs(clients) do
                if client == "tsserver" then
                    lspconfig[client].setup({
                        on_attach = on_attach,
                        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
                        cmd = { "typescript-language-server", "--stdio" },
                        capabilities = capabilities,
                    })
                else
                    lspconfig[client].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end
            end


            lspconfig.lua_ls.setup {
                on_attach = on_attach,
                capabilities = capabilities
            }

            lspconfig.solargraph.setup{
                on_attach = on_attach,
                settings = {
                    solargraph = {
                        -- Use this to deactivate diagnostics completely and
                        -- to not collide with Rubocop or create a .solargraph.yaml
                        -- with a Rubocop reporter.
                        diagnostics = false
                    }
                }
            }

            -- Diagnostic symbols in the sign column (gutter)
            local signs = { Error = "x", Warn = "~", Hint = "!", Info = "i" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end


            local M = {}

            M.icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "",
                Interface = "ﰮ",
                Module = "",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "﬌",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "ﬦ",
                TypeParameter = "",
            }

            local function setup_completion_item_icons()
                local kinds = protocol.CompletionItemKind
                for i, kind in ipairs(kinds) do
                kinds[i] = M.icons[kind] or kind
              end
            end

            setup_completion_item_icons()
        end
    }
}
