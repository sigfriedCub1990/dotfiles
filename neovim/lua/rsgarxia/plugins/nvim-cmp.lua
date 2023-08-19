return {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Completion sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            -- Complements
            "onsails/lspkind-nvim"
        },
        event = "VeryLazy",
        config = function()
            local cmp = require "cmp"
            local lspkind = require "lspkind"

            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            local function expand_snippet(args)
              return require("luasnip").lsp_expand(args.body)
            end

            cmp.setup {
                mapping = {
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                snippet = { expand = expand_snippet },
                sources = {
                    { name = "nvim_lsp", priority = 10 },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                formatting = { format = lspkind.cmp_format() }
            }
        end
}
