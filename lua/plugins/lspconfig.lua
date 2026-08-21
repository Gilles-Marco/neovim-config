return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "b0o/SchemaStore.nvim"
    },
    config = function()
        require("mason").setup({
            ensure_installed = {
                "tflint",
                "ruff",
                "prettier"
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "basedpyright",
                "ruff",
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
                            disableOrganizeImports = true,
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
                    python = {
                        analysis = {
                            typeCheckingMode = "standard"
                        }
                    }
                },
            },
            ruff = {
                on_attach = function(client, bufnr)
                    client.server_capabilities.hoverProvider = false
                end
            },
            lua_ls = {},
            terraformls = {
                on_attach = function() end,
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
            yamlls = {
                -- Have to add this for yamlls to understand that we support line folding
                capabilities = {
                    textDocument = {
                        foldingRange = {
                            dynamicRegistration = false,
                            lineFoldingOnly = true,
                        },
                    },
                },
                -- lazy-load schemastore when needed
                before_init = function(_, new_config)
                    new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                        "force",
                        new_config.settings.yaml.schemas or {},
                        require("schemastore").yaml.schemas()
                    )
                end,
                settings = {
                    redhat = { telemetry = { enabled = false } },
                    yaml = {
                        keyOrdering = false,
                        format = {
                            enable = true,
                        },
                        validate = true,
                        schemaStore = {
                            -- Must disable built-in schemaStore support to use
                            -- schemas from SchemaStore.nvim plugin
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = "",
                        },
                    },
                },
            },
        }

        for name, config in pairs(servers) do
            vim.lsp.config[name] = config
            vim.lsp.enable(name)
        end
    end,
}
