return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },         -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },    -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig

    -- Add CodeCompanion so output properly renders
    ft = { "markdown", "codecompanion" },
    opts = {
        -- Ensures rendering stays active in all modes (Insert/Visual/Normal)
        -- render_modes = true,
        file_types = { "markdown", "codecompanion" },
    },
}
