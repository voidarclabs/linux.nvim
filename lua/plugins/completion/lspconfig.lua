return {
	"neovim/nvim-lspconfig",

	-- This custom config function will run *instead* of the default.
	-- It receives the 'opts' table (second argument) and loops through it.
	config = function(_, opts)
		-- 1. Get the default capabilities from cmp_nvim_lsp
		-- (Your emmet_ls config was already using this, so we'll make it
		-- the default for all servers. This includes snippetSupport.)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")

		-- 2. Loop over the servers defined in 'opts.servers'
		for server_name, server_config in pairs(opts.servers or {}) do
			-- 3. Merge default capabilities with server-specific config
			--    'vim.tbl_deep_extend' ensures server-specific settings
			--    (like for emmet_ls) are preserved.
			local config = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
			}, server_config or {})

			-- 4. Setup the server
			lspconfig[server_name].setup(config)
		end
	end,

	-- 'opts' table now holds all server-specific configurations
	opts = {
		servers = {
			-- Servers with no special config are just empty tables
			nil_ls = {},
			nixd = {},
			lua_ls = {},
			pyright = {},
			cssls = {}, -- No longer needs 'capabilities = capabilities'
			ts_ls = {}, -- No longer needs 'capabilities = capabilities'
			rust_analyzer = {},

			-- emmet_ls settings are preserved here
			emmet_ls = {
				filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
				-- Note: We no longer need to define 'capabilities' here,
				-- as it gets the merged default from the config function.
			},
		},
	},
}
