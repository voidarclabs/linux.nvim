return {
	"echasnovski/mini.nvim",
	version = "",

	config = function()
		require("mini.pairs").setup() -- Bracket pairs and stuff
		require("mini.ai").setup() -- Around and In extension for visual mode
		require("mini.surround").setup() -- Suround selections with characters
		require("mini.move").setup({
			mappings = {
				down = "J",
				up = "K",
			},
		})

		require("mini.icons").setup() -- Icon provider
	end,
}
