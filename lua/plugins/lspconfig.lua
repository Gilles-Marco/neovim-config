return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()

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

        local servers = {
            basedpyright = {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "standard",
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
            lua_ls = {},
            terraformls = {},
            gopls = {},
            jdtls = {},
            clangd = {},
            rust_analyzer = {},
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
