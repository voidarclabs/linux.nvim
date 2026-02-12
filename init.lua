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
vim.keymap.set("n", "<leader>bd", function() -- delete buffer
	vim.cmd("bd")
	vim.cmd("echo 'Buffer deleted'")
end, { noremap = true })

-- Sane tab management
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Undo management
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Better Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Nowrap
vim.opt.wrap = false

-- Colorcheme
vim.cmd.colorscheme("catppuccin-mocha")

-- Scrolloff
vim.opt.scrolloff = math.floor(vim.o.lines / 2) - 3

-- Force proper keybindings
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- C-BS for deleting whole word in insert mode
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true })

-- Keybinds for saving and stuff
-- vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>qs", function() -- quit and save session
-- 	vim.cmd("AutoSession save")
-- 	vim.cmd("wqa")
-- end, { noremap = true })
-- vim.keymap.set("n", "<leader>qd", function() -- quit and delete session
-- 	vim.cmd("AutoSession delete")
-- 	vim.cmd("wqa")
-- end, { noremap = true })
