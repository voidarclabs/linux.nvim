return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "rust_analyzer" }, -- Add your desired LSPs
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.rust_analyzer.setup({})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip", -- Completion for snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			-- Explicitly define linters for each file type (without ast_grep)
			lint.linters_by_ft = {
				lua = { "luacheck" }, -- Use "luacheck" instead of "ast_grep"
				python = { "flake8" },
				javascript = { "eslint" },
				typescript = { "eslint" },
			}

			-- Check if ast_grep is accidentally registered and remove it
			lint.linters.ast_grep = nil

			-- Auto-run the linter only for the configured filetypes
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "!*.lua",
				callback = function()
					local ft = vim.bo.filetype
					if lint.linters_by_ft[ft] then
						lint.try_lint()
					end
				end,
			})
		end,
	},

	-- autoformatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					python = { "black" },
				},
				format_on_save = true,
			})
		end,
	},
}
