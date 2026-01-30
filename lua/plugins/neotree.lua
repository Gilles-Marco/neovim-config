return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = { 
	{ "<C-b>", "<cmd>Neotree toggle<cr>", desc = "Neotree open project drawer" } 
    },
    opts = {
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = {
		mappings = {
			["<C-b>"] = "close_window"
		}
	}
    }
  }
}
