return {
	"rmagatti/auto-session",
	lazy = false,

	opts = {
		session_lens = {
			picker = "telescope",
			load_on_setup = true,
			picker_opts = {
				border = false,
			},
		},
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		git_use_branch_name = true,
		git_auto_restore_on_branch_change = true,
		purge_after_minutes = 14400,
		show_auto_restore_notif = true,
	},

	config = function()
		require("auto-session").setup({})
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		vim.keymap.set("n", "<leader>as", "<cmd>AutoSession search<CR>", { noremap = true })
		vim.keymap.set("n", "<leader>an", "<cmd>AutoSession save<CR>", { noremap = true })
		vim.keymap.set("n", "<leader>ad", "<cmd>AutoSession delete<CR>", { noremap = true })
	end,
}
