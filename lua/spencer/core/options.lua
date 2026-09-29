local home = os.getenv("HOME") or os.getenv("USERPROFILE")

-- Global Options (Map Leader)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- Cursor Setting
vim.opt.guicursor = ""

-- Column Settings
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Tab Rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "typescript" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- Long Line Behaviour
vim.opt.wrap = false

-- Search behaviour
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Theme
vim.opt.termguicolors = true

-- Scrolling behaviour
vim.opt.scrolloff = 8

-- Other
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true
