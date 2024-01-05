local global = vim.g

vim.cmd([[
    function! Scrollbar()
        let width = 9
        let perc = (line('.') - 1.0) / (max([line('$'), 2]) - 1.0)
        let before = float2nr(round(perc * (width - 3)))
        let after = width - 3 - before
        return '[' . repeat(' ',  before) . '=' . repeat(' ', after) . ']'
    endfunction
]])

vim.cmd([[
    function! LeftSide()
        let fileformat = &fileformat
        let encoding = &encoding
        return fileformat . ' | ' . encoding . ' |'
    endfunction
]])


vim.cmd([[
    " Status line
    set statusline=             " Reset statusline
    set statusline=[%{mode()}]\ " Current active mode
    set statusline+=%10f\       " Name of the file
    set statusline+=(%{&ft})    " Filetype
    set statusline+=%=          " Jump to right side
    set statusline+=%{Scrollbar()}
    set statusline+=\ %{LeftSide()}
    set statusline+=%2l         " Current line
    set statusline+=:           " Separator
    set statusline+=%L          " Total # of lines
]])

vim.cmd([[
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
]])


--Map blankline
global.indent_blankline_char = "┊"
global.indent_blankline_filetype_exclude = { "help", "packer" }
global.indent_blankline_buftype_exclude = { "terminal", "nofile" }
global.indent_blankline_show_trailing_blankline_indent = false
