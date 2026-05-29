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

if not is_windows then
    spec.dependencies = { "nvim-tree/nvim-web-devicons" }
end

return spec
