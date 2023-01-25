local set = vim.opt

vim.cmd([[colorscheme gruvbox]])

-- Disable initial Vim message
set.shortmess = "I"

-- Don't display mode below status line (lightline)
set.showmode = false

-- Set completeopt to have a better completion experience
set.completeopt = "menu,menuone,noselect"
set.signcolumn = "yes"

-- moving around, searching and patterns
set.path = ".,**"
set.ignorecase = true
set.smartcase = true

-- tabs and indenting
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

-- relative movement
set.relativenumber = true

--Make line numbers default
vim.wo.number = true

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- displaying text
set.scrolloff = 5
set.display = "truncate"
set.fillchars = { vert = "│" }
set.lazyredraw = true
set.list = true
set.listchars = {
    extends = "⟩",
    nbsp = "␣",
    precedes = "⟨",
    tab = "► ",
    trail = "·",
}

-- multiple windows
set.previewheight = 5
set.splitbelow = true
set.splitright = true

-- selecting text
set.clipboard = "unnamedplus,unnamed"

-- reading and writing files
set.fileformats = "unix"
set.writebackup = false
set.autowrite = true

-- the swap file
set.swapfile = false
