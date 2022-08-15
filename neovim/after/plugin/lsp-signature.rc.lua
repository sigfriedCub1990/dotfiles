local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
    return
end

lsp_signature.setup({
    bind = true,
    floating_window_above_cur_line = true,
    hint_enable = false,
    handler_opts = { border = "none" },
})
