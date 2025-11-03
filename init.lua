-- Set mapleader
vim.g.mapleader = "<Space>"

-- Lazy
require("config.lazy")

-- Line numbers
vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" }) -- overlay0
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true }) -- mauve

-- Windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.winborder = "rounded"

-- Sane keymaps
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "q:", ":", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bq", "<cmd>bd<CR>", { noremap = true, silent = true })

-- Sane tab management
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Undo management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Better Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colorcheme
vim.cmd.colorscheme("catppuccin-mocha")

-- Scrolloff
vim.opt.scrolloff = 8

-- Force proper keybindings
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Center cursor after scrolling with Ctrl-d / Ctrl-u
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })

-- C-BS for deleting whole word in insert mode
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true })

-- Keybinds for saving and stuff
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>qs", function()
	vim.cmd("AutoSession save")
	vim.cmd("wqa")
end, { noremap = true })
