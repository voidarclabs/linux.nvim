vim.g.mapleader = "<Space>"

require("config.lazy")

vim.opt.splitbelow = true

vim.cmd.colorscheme("catppuccin-mocha")

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
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep_live<cr>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>")

vim.keymap.set("n", "<leader>k", "<cmd>lua Snacks.lazygit()<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>FloatermKill<CR>")

vim.keymap.set("i", "jj", "<Esc>")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

require("leap").set_default_mappings()
