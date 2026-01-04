return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				python = { "black" },
				nix = { "nixfmt" },
			},
			format_on_save = true,
		})
	end,
}
