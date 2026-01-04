return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { ".git" },
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-L" },
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
				},
			},
		})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end, { desc = "Telescope find files (current file dir)" })

		vim.keymap.set("n", "<space>fn", function()
			require("telescope").extensions.file_browser.file_browser()
		end)

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep()
		end, { desc = "Telescope live grep (current file dir)" })

		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers({ cwd = vim.fn.expand("%:p:h") }) -- buffers don’t need cwd, but harmless
		end, { desc = "Telescope buffers" })

		require("telescope").load_extension("file_browser")
	end,
}
