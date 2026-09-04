return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup({ style = 'warmer' })
        require('onedark').load()
        -- vim.cmd.colorscheme("onedark") -- Doesn't always work, follow other repo always
    end
}
