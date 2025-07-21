vim.g.mapleader = "<Space>"

require("config.lazy")

vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" }) -- overlay0
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true }) -- mauve

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "<leader>wd", "<cmd>lua Snacks.dashboard()<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>lua Snacks.picker.undo()<CR>")

vim.keymap.set("n", "<leader>k", "<cmd>FloatermNew lazygit<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>FloatermKill<CR>")

vim.keymap.set("i", "jj", "<Esc>")

vim.lsp.set_log_level("debug")

require("leap").set_default_mappings()
