return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					-- Tell the server to let Neovim handle snippet expansion
					completion = {
						callSnippet = "Replace",
					},
					-- Use LuaJIT (which Neovim uses)
					runtime = {
						version = "LuaJIT",
					},
				},
			},
		})
		vim.lsp.config("emmet_ls", {
			-- 			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})
		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
			"cssls",
			"nixd",
			"rust_analyzer",
			"emmet_ls",
		})
	end,
}
