return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>p", "<cmd>Telescope find_files hidden=true no_ignore=false<cr>", desc = "Find files" },
        { "<leader>l", "<cmd>Telescope live_grep hidden=true no_ignore=false<cr>",  desc = "Find string occurence" },
    }
}
