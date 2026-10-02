return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP completions
                { name = "luasnip" },  -- Snippets
                { name = "buffer" },   -- Text within current buffer
                { name = "path" },     -- File system paths
            }),
        })
    end,
}
