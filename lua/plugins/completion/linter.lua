return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		-- Explicitly define linters for each file type (without ast_grep)
		lint.linters_by_ft = {
			python = { "flake8" },
			javascript = { "eslint" },
			typescript = { "eslint" },
		}

		-- Only show diagnostics close to the cursor
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				-- You can make prefix dynamic based on severity using a function
				prefix = function(diagnostic)
					local icons = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					}
					return icons[diagnostic.severity] or "●"
				end,
			},
			signs = false,
			underline = true,
			update_in_insert = false,
		})

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
}
