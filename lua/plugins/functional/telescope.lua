return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ cwd = vim.fn.expand("%:p:h"), hidden = true })
		end, { desc = "Telescope find files (current file dir)" })

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ cwd = vim.fn.expand("%:p:h") })
		end, { desc = "Telescope live grep (current file dir)" })

		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers({ cwd = vim.fn.expand("%:p:h") }) -- buffers don’t need cwd, but harmless
		end, { desc = "Telescope buffers" })
	end,
}
