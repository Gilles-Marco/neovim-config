return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("mason").setup({
            ensure_installed = {
                "tflint"
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "basedpyright",
                "lua_ls",
                "terraformls",
                "gopls",
                "jdtls",
                "clangd",
                "rust_analyzer",
                "ruby_lsp",
                "ts_ls",
                "bashls",
            },
        })

        require('mason-tool-installer').setup({
            "black",
            "isort",
            "tflint",
            "stylua",
            "prettier",
            "shfmt",
            "clang-format",
            "google-java-formatter",
            "goimports", "gofmt",
            "xmlformatter",
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local servers = {
            basedpyright = {
                capabilities = capabilities,
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "standard",
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                            inlayHints = {
                                variableType = true,
                                callArgumentNames = true,
                                functionReturnTypes = true,
                                genericTypes = true,
                            },
                        },
                    },
                },
            },
            lua_ls = {},
            terraformls = {
                capabilities = capabilities,
                init_options = {
                    ignoreSingleFileWarning = true
                },
            },
            gopls = {},
            jdtls = {},
            clangd = {},
            rust_analyzer = {
                capabilities = capabilities,
                ["rust-analyzer"] = {
                    inlayHints = {
                        bindingModeHints = { enable = true },
                        chainingHints = { enable = true },
                        closingBraceHints = { enable = true, minLines = 25 },
                        closureReturnTypeHints = { enable = "always" },
                        maxLength = 25,
                        parameterHints = { enable = true },
                        reborrowHints = { enable = "always" },
                        renderColons = true,
                        typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
                    },
                },
            },
            ruby_lsp = {},
            ts_ls = {},
            bashls = {},
        }

        for name, config in pairs(servers) do
            vim.lsp.config[name] = config
            vim.lsp.enable(name)
        end
    end,
}
