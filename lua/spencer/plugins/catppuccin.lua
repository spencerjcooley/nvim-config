return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,

    opts = {
      flavour = "mocha",
      background = {
        light = "mocha",
        dark = "mocha",
      },

      transparent_background = false,
      term_colors = true,

      integrations = {},
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
