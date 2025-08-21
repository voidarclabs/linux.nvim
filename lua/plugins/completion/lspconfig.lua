return {
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls", "pyright", "rust_analyzer", "eslint" }, -- Add your desired LSPs
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			--Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({})
			lspconfig.cssls.setup({})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({})
			lspconfig.emmet_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "html", "css", "javascriptreact", "typescriptreact" }, -- Add more if needed
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
