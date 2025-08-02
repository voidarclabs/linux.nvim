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
		require("mini.move").setup({
			mappings = {
				down = "J",
				up = "K",
			},
		})
		require("mini.surround").setup({
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd", -- Delete surrounding
				find = "<leader>sf", -- Find surrounding (to the right)
				find_left = "<leader>sF", -- Find surrounding (to the left)
				highlight = "<leader>sh", -- Highlight surrounding
				replace = "<leader>sr", -- Replace surrounding
				update_n_lines = "<leader>sn", -- Update `n_lines`
			},
		})
		require("mini.ai").setup({
			mappings = {
				-- Main textobject prefixes
				around = "a",
				inside = "i",

				-- Next/last variants
				-- NOTE: These override built-in LSP selection mappings on Neovim>=0.12
				-- Map LSP selection manually to use it (see `:h MiniAi.config`)
				around_next = "<leader>an",
				inside_next = "<leader>in",
				around_last = "<leader>al",
				inside_last = "<leader>il",

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = "<leader>g[",
				goto_right = "<leader>g]",
			},
		})
		require("mini.pick").setup({})
	end,
}
