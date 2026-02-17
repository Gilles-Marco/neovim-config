return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap",
    },
    ft = "python",
    keys = {
        { "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true
            }
        }
    }
}
