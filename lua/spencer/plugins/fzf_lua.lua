return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,

    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    ---@diagnostic enable: missing-fields

    keys = {
        { "<leader>ff", false },

        {
            "<leader>pf",
            function ()
                require("fzf-lua").files()
            end,
            desc = "Find Files"
        },

        {
            "<C-p>",
            function ()
                require("fzf-lua").git_files()
            end,
            desc = "Git Files",
        },

        {
            "<leader>ps",
            function ()
                local query = vim.fn.input("Grep > ")
                if query ~= "" then
                    require("fzf-lua").live_grep({
                        search = query,
                    })
                end
            end,
            desc = "Grep String",
        },
        
        {
            "<leader>pb",
            function ()
                require("fzf-lua").buffers()
            end,
            desc = "Search Buffers",
        },
    },
}
