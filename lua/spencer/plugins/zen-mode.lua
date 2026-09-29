return {
  "folke/zen-mode.nvim",
  ft = { "markdown", "text" },
  opts = {
    window = {
      width = 120,
    },
  },
  config = function(_, opts)
    require("zen-mode").setup(opts)

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.md", "*.txt" },
      callback = function()
        require("zen-mode").open()

        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
      end,
    })

    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = { "*.md", "*.txt" },
      callback = function()
        require("zen-mode").close()
      end,
    })
  end,
}

