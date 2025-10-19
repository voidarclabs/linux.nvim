return {
	"mbbill/undotree",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>")
	end,
}
