return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                -- neo-tree will lazily load itself
        keys = {
            { "<leader>b", "<cmd>Neotree toggle<cr>", desc = "Neotree open project drawer" },
            { "<C-b>",     false },
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            window = {
                mappings = {
                    ["<leader>b"] = "close_window"
                }
            }
        }
    }
}
