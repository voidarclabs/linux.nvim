return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		-- Enable snippet capability for completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig.lua_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({})
		lspconfig.emmet_ls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
			init_options = {
				html = {
					options = {
						["bem.enabled"] = true,
					},
				},
			},
		})
	end,
}
