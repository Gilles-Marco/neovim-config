return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
	{ "<C-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find files" },
	{ "<C-l>", "<cmd>Telescope live_grep hidden=true no_ignore=true<cr>", desc = "Find string occurence" },
    }
}
