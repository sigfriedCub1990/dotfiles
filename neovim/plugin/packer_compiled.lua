-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
    vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
    return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
    local time
    local profile_info
    local should_profile = false
    if should_profile then
        local hrtime = vim.loop.hrtime
        profile_info = {}
        time = function(chunk, start)
            if start then
                profile_info[chunk] = hrtime()
            else
                profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
            end
        end
    else
        time = function(chunk, start) end
    end

    local function save_profiles(threshold)
        local sorted_times = {}
        for chunk_name, time_taken in pairs(profile_info) do
            sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
        end
        table.sort(sorted_times, function(a, b)
            return a[2] > b[2]
        end)
        local results = {}
        for i, elem in ipairs(sorted_times) do
            if not threshold or threshold and elem[2] > threshold then
                results[i] = elem[1] .. " took " .. elem[2] .. "ms"
            end
        end

        _G._packer = _G._packer or {}
        _G._packer.profile_output = results
    end

    time([[Luarocks path setup]], true)
    local package_path_str =
        "/home/sigfried/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sigfried/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sigfried/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sigfried/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
    local install_cpath_pattern = "/home/sigfried/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
    if not string.find(package.path, package_path_str, 1, true) then
        package.path = package.path .. ";" .. package_path_str
    end

    if not string.find(package.cpath, install_cpath_pattern, 1, true) then
        package.cpath = package.cpath .. ";" .. install_cpath_pattern
    end

    time([[Luarocks path setup]], false)
    time([[try_loadstring definition]], true)
    local function try_loadstring(s, component, name)
        local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
        if not success then
            vim.schedule(function()
                vim.api.nvim_notify(
                    "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
                    vim.log.levels.ERROR,
                    {}
                )
            end)
        end
        return result
    end

    time([[try_loadstring definition]], false)
    time([[Defining packer_plugins]], true)
    _G.packer_plugins = {
        LuaSnip = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/LuaSnip",
            url = "https://github.com/L3MON4D3/LuaSnip",
        },
        ["auto-pairs"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/auto-pairs",
            url = "https://github.com/jiangmiao/auto-pairs",
        },
        ["cmp-nvim-lsp"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
            url = "https://github.com/hrsh7th/cmp-nvim-lsp",
        },
        cmp_luasnip = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
            url = "https://github.com/saadparwaiz1/cmp_luasnip",
        },
        ["friendly-snippets"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/friendly-snippets",
            url = "https://github.com/rafamadriz/friendly-snippets",
        },
        fzf = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/fzf",
            url = "https://github.com/junegunn/fzf",
        },
        ["fzf.vim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/fzf.vim",
            url = "https://github.com/junegunn/fzf.vim",
        },
        ["gitsigns.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
            url = "https://github.com/lewis6991/gitsigns.nvim",
        },
        ["gruvbox.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
            url = "https://github.com/ellisonleao/gruvbox.nvim",
        },
        ["impatient.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/impatient.nvim",
            url = "https://github.com/lewis6991/impatient.nvim",
        },
        ["lightline.vim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/lightline.vim",
            url = "https://github.com/itchyny/lightline.vim",
        },
        ["lsp_signature.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
            url = "https://github.com/ray-x/lsp_signature.nvim",
        },
        ["lspkind-nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
            url = "https://github.com/onsails/lspkind-nvim",
        },
        ["null-ls.nvim"] = {
            config = {
                "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0",
            },
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
            url = "https://github.com/jose-elias-alvarez/null-ls.nvim",
        },
        ["nvim-cmp"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/nvim-cmp",
            url = "https://github.com/hrsh7th/nvim-cmp",
        },
        ["nvim-lspconfig"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
            url = "https://github.com/neovim/nvim-lspconfig",
        },
        ["nvim-treesitter"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
            url = "https://github.com/nvim-treesitter/nvim-treesitter",
        },
        ["nvim-treesitter-textobjects"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
            url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
        },
        ["packer.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/packer.nvim",
            url = "https://github.com/wbthomason/packer.nvim",
        },
        ["plenary.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/plenary.nvim",
            url = "https://github.com/nvim-lua/plenary.nvim",
        },
        ["telescope.nvim"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/telescope.nvim",
            url = "https://github.com/nvim-telescope/telescope.nvim",
        },
        ["vim-commentary"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/vim-commentary",
            url = "https://github.com/tpope/vim-commentary",
        },
        ["vim-fugitive"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/vim-fugitive",
            url = "https://github.com/tpope/vim-fugitive",
        },
        ["vim-gutentags"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/vim-gutentags",
            url = "https://github.com/ludovicchabant/vim-gutentags",
        },
        ["vim-surround"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/vim-surround",
            url = "https://github.com/tpope/vim-surround",
        },
        ["vim-table-mode"] = {
            loaded = true,
            path = "/home/sigfried/.local/share/nvim/site/pack/packer/start/vim-table-mode",
            url = "https://github.com/dhruvasagar/vim-table-mode",
        },
    }

    time([[Defining packer_plugins]], false)
    -- Config for: null-ls.nvim
    time([[Config for null-ls.nvim]], true)
    try_loadstring(
        "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0",
        "config",
        "null-ls.nvim"
    )
    time([[Config for null-ls.nvim]], false)
    if should_profile then
        save_profiles()
    end
end)

if not no_errors then
    error_msg = error_msg:gsub('"', '\\"')
    vim.api.nvim_command(
        'echohl ErrorMsg | echom "Error in packer_compiled: '
            .. error_msg
            .. '" | echom "Please check your config for correctness" | echohl None'
    )
end
