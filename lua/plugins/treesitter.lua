return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		indent = { enable = true },
		highlight = { enable = true },
		folds = { enable = true },
		ensure_installed = {
			"hcl",
			"terraform",
			"go",
			"java",
			"python",
			"rust",
			"lua",
			"toml",
			"json",
			"xml",
			"yaml",
			"html",
			"javascript",
			"typescript",
			"vim",
			"tsx",
			"markdown",
			"c",
			"bash"
		},
	},
}
