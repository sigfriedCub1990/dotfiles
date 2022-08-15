local global = vim.g

-- Lightline config
global.lightline = {
    colorscheme = "gruvbox",
    active = {
        left = {
            { "mode", "paste" },
            { "gitbranch", "readonly", "filename", "modified" },
        },
    },
    component_function = { gitbranch = "FugitiveHead" },
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

vim.g["fzf_layout"] = { down = "40%" }
