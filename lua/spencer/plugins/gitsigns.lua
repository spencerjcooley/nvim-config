return {
    "lewis6991/gitsigns.nvim",

    event = { "BufReadPre", "BufNewFile" },

    opts = {
        signs = {
            add          = { text = "│" },
            change       = { text = "│" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },

        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,

        current_line_blame = false,
    },

    keys = {
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            desc = "Next Git change",
        },

        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            desc = "Previous Git change",
        },

        {
            "<leader>ph",
            function()
                require("gitsigns").preview_hunk()
            end,
            desc = "Preview Git change",
        },

        {
            "<leader>pH",
            function()
                require("gitsigns").preview_hunk_inline()
            end,
            desc = "Preview Git change inline",
        },

        {
            "<leader>pB",
            function()
                require("gitsigns").blame_line()
            end,
            desc = "Blame Current Line",
        },
    },
}
