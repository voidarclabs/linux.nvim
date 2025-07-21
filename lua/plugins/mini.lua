return {
	"echasnovski/mini.nvim",
	version = "*", -- or a specific tag
	config = function()
		-- Only load the modules you want
		require("mini.animate").setup({
			cursor = {
				enable = false,
			},
		})
		require("mini.pairs").setup()
		require("mini.files").setup()
		require("mini.cursorword").setup({
			content = {
				active = true,
			},
		})
		require("mini.notify").setup()
	end,
}
