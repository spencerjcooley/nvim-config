return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", 
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Only enable if a treesitter parser is available for the filetype
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if lang and vim.treesitter.query.get(lang, "highlights") then
                    vim.treesitter.start()
                end
            end,
        })
    end,
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            install = {
                parsers = { 
                    "c", 
                    "cpp", 
                    "python", 
                    "bash", 
                    "lua", 
                    "vim", 
                    "vimdoc", 
                    "query" 
                }
            }
        })
    end,
}
