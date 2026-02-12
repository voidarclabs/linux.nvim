return {
	"echasnovski/mini.nvim",
	version = "",

	config = function()
		local animate = require("mini.animate")
		require("mini.pairs").setup() -- Bracket pairs and stuff
		require("mini.ai").setup() -- Around and In extension for visual mode
		require("mini.cursorword").setup() -- Underline current word below cursor (makes it easier to c and d)
		require("mini.indentscope").setup({
			symbol = "│",
			draw = {
				delay = 10,
				animation = require("mini.indentscope").gen_animation.linear({
					duration = 15,
					unit = "step",
					easing = "out",
				}),
			},
		}) -- Indent lines
		require("mini.trailspace").setup() -- Shows useless spaces
		require("mini.sessions").setup({
			autosread = true,
			autowrite = true,
			file = ".session",
		})
		require("mini.notify").setup() -- Better Notifications
		require("mini.surround").setup() -- Suround selections with characters
		require("mini.move").setup({
			mappings = {
				down = "J",
				up = "K",
			},
		})

		require("mini.icons").setup() -- Icon provider
		require("mini.animate").setup({
			cursor = {
				enable = false,
			},
			scroll = {
				-- Animate for 200 milliseconds with linear easing
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				-- Animate equally but with at most 120 steps instead of default 60
				subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
			},
			open = {
				-- Animate for 400 milliseconds with linear easing
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				-- Animate with wiping from nearest edge instead of default static one
				winconfig = animate.gen_winconfig.wipe({ direction = "from_edge" }),
				-- Make bigger windows more transparent
				winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
			},
			close = {
				-- Animate for 400 milliseconds with linear easing
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				-- Animate with wiping to nearest edge instead of default static one
				winconfig = animate.gen_winconfig.wipe({ direction = "to_edge" }),
				-- Make bigger windows more transparent
				winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
			},
		})
	end,
}
