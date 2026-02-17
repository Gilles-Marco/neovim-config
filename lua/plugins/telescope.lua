return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>p", "<cmd>Telescope find_files hidden=true no_ignore=false<cr>", desc = "Find files" },
        { "<leader>l", "<cmd>Telescope live_grep hidden=true no_ignore=false<cr>",  desc = "Find string occurence" },
    },
    specs = {
        {
            "ANGkeith/telescope-terraform-doc.nvim",
            ft = { "terraform", "hcl" },
            config = function()
                LazyVim.on_load("telescope.nvim", function()
                    require("telescope").load_extension("terraform_doc")
                end)
            end,
        },
        {
            "cappyzawa/telescope-terraform.nvim",
            ft = { "terraform", "hcl" },
            config = function()
                LazyVim.on_load("telescope.nvim", function()
                    require("telescope").load_extension("terraform")
                end)
            end,
        },
    },
    opts = function(_, opts)
        local actions = require "telescope.actions"
        opts.defaults = opts.defaults or {}
        opts.defaults.mappings = opts.defaults.mappings or {}
        opts.defaults.mappings.i = opts.defaults.mappings.i or {}
        opts.defaults.mappings.i["<C-t>"] = actions.select_vertical

        opts.defaults.file_ignore_patterns = {
            "node_modules/.*",
            "%.venv/.*",
            "venv/.*",
            "build/.*",
            "dist/.*",
            "%.git/.*",
        }
    end
}
