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

vim.keymap.set("n", "<C-w>d", "<cmd>lua Snacks.dashboard()<CR>")
vim.keymap.set("n", "<A-w>d", "<cmd>lua Snacks.dashboard()<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>JABSOpen<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>lua MiniFiles.open()<CR>")

vim.keymap.set("n", "<M-w>", "<C-w>")
vim.keymap.set("n", "<C-k>", "<cmd>FloatermNew lazygit<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>FloatermKill<CR>")

vim.lsp.set_log_level("debug")
