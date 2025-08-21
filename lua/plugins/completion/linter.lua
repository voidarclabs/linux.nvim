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
