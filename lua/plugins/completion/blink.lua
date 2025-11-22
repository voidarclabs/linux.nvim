return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	opts = {
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				priority = 100,
			},
		},

		-- Snippet configuration
		snippets = {
			preset = "luasnip", -- Tells blink.cmp to use LuaSnip
		},

		fuzzy = { implementation = "lua" },

		signature = { enabled = true },

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},

		-- Keymaps
		keymap = {
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		},
		sources = {
			default = {
				"lsp", -- (Equivalent to cmp-nvim-lsp)
				"snippets", -- (Handled by the snippets config, replaces cmp_luasnip source)
				"buffer", -- (Equivalent to cmp-buffer)
				"path", -- (Equivalent to cmp-path)
				-- "cmdline", -- Generally configured separately, but often included by default
			},
		},
	},
}
