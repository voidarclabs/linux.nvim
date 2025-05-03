return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "lua", "python", "html", "css", "typescript", "rust" }, -- Add JavaScript here
			highlight = {
				enable = true, -- Enable syntax highlighting
			},
		})
	end,
}
