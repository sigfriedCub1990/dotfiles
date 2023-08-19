-- vim.lsp.set_log_level("debug")

-- Must be called before lspconfig import
require("neodev").setup{}
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end
local protocol = require("vim.lsp.protocol")

local on_attach = function(_, bufnr)
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

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local clients = { "clangd", "pyright", "elmls", "tsserver", "bashls", "dockerls", "astro", "erlangls", "clojure_lsp" }
for _, client in ipairs(clients) do
    if client == "tsserver" then
        nvim_lsp[client].setup({
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities,
        })
    else
        nvim_lsp[client].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

nvim_lsp.lua_ls.setup{}
nvim_lsp.solargraph.setup{
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

vim.diagnostic.config({
    virtual_text = {
        source = "if_many"
    },
    severity_sort = true,
    update_in_insert = true,
    float = {
        source = "if_many", -- Or 'if_many'
    },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = {
        severity = vim.diagnostic.severity.ERROR
    },
    update_in_insert = true,
    severity_sort = true,
})
