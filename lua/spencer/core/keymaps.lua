-- Return to NETRW
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines (VISUAL MODE)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Improved default commands
vim.keymap.set("n", "J", "mzJ`z")           -- Don't move cursor on J command.
vim.keymap.set("n", "<C-d>", "<C-d>zz")     -- Don't move cursor on <C-d>
vim.keymap.set("n", "<C-u>", "<C-u>zz")     -- Don't move cursor on <C-u>
vim.keymap.set("n", "=ap", "ma=ap'a")       -- Don't move cursor on =ap
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Lowkey goated
vim.keymap.set({ "n", "v" }, "Q", "@q")

-- Even better (ThePrimeagen)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
