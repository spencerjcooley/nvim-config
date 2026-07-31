local is_windows = package.config:sub(1,1) ==  "\\"

local spec = {
    "ibhagwan/fzf-lua",

    lazy = false,

    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {
        files = {
            -- Icons are insanely slow on Windows for some reason.
            file_icons = not is_windows,
            git_icons = not is_windows,
        },
    },
    ---@diagnostic enable: missing-fields

    keys = {
        { "<leader>ff", false },

        {
            "<leader>pf",   -- Project Files
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
            "<leader>pg",   -- Project Grep
            function ()
                require("fzf-lua").live_grep()
            end,
            desc = "Grep String"
        },

        {
            "<leader>pb",   -- Project Buffers
            function ()
                require("fzf-lua").buffers()
            end,
            desc = "Search Buffers",
        },
    },
}

-- Only enable icons if not on Windows (slows down a lot)
if not is_windows then
    spec.dependencies = { "nvim-tree/nvim-web-devicons" }
end

return spec
