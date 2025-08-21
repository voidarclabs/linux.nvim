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
                ensure_installed = { "ts_ls", "lua_ls", "pyright", "rust_analyzer", "eslint" }, -- Add your desired LSPs
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            --Enable (broadcasting) snippet capability for completion
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            vim.lsp.config("qmlls", {
                default_config = {
                    cmd = { "qmlls" },
                    filetypes = { "qml" },
                    root_dir = lspconfig.util.root_pattern(".git", "."),
                }
            }

        )
        vim.lsp.config("cssls", {
            capabilities = capabilities,
        })
        lspconfig.pyright.setup({})
        lspconfig.cssls.setup({})
        lspconfig.qmlls.setup({})
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
                { name = "nvim_lsp" }, -- This should provide LSP completions like for ESLint
                -- { name = "luasnip" },
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
