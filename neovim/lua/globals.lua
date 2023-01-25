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

-- Lightline config
global.lightline = {
    mode_map = {
        n = "N",
        i = "I",
        R = "R",
        v = "V",
        V = "VL",
        c = "C",
        s = "S",
        S = "SL",
        t = "T",
        -- "C\-v" = 'VB',
        -- "C\-s" = 'SB',
    },
    active = {
        left = {
            { "mode", "paste" },
            { "gitbranch", "readonly", "filename", "modified" },
        },
        right = {
            {"indicator", "filetype", "fileformat", "fileencoding", "lineinfo"},
        },
    },
    component_function = {
        gitbranch = "FugitiveHead",
        indicator = "Scrollbar",
    },
}

-- Gutentags config
global.gutentags_ctags_exclude = {
    ".git",
    ".svg",
    ".hg",
    "/tests/",
    "build",
    "dist",
    "bin",
    "node_modules",
    "bower_components",
    "cache",
    "compiled",
    "docs",
    "example",
    "bundle",
    "vendor",
    ".md",
    "-lock.json",
    ".lock",
    "bundle.js",
    "build.js",
    ".rc",
    ".json",
    ".min.",
    ".map",
    ".bak",
    ".zip",
    ".pyc",
    ".class",
    ".sln",
    ".Master",
    ".csproj",
    ".tmp",
    ".csproj.user",
    ".cache",
    ".pdb",
    "tags",
    "cscope.",
    ".css",
    ".less",
    ".scss",
    ".exe",
    ".dll",
    ".mp3",
    ".ogg",
    ".flac",
    ".swp",
    ".swo",
    ".bmp",
    ".gif",
    ".ico",
    ".jpg",
    ".png",
    ".rar",
    ".zip",
    ".tar",
    ".tar.gz",
    ".tar.xz",
    ".tar.bz2",
    ".pdf",
    ".doc",
    ".docx",
    ".ppt",
    ".pptx",
}
global.gutentags_cache_dir = "~/.cache/nvim/tags"
global.gutentags_generate_on_write = 1
global.gutentags_generate_on_new = 1
global.gutentags_generate_on_missing = 1
global.gutentags_generate_on_empty_buffer = 0

--Map blankline
global.indent_blankline_char = "┊"
global.indent_blankline_filetype_exclude = { "help", "packer" }
global.indent_blankline_buftype_exclude = { "terminal", "nofile" }
global.indent_blankline_show_trailing_blankline_indent = false
