return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
        { "<leader>ca", "<cmd>BufferLineCloseOthers<CR>", desc = "Close all other buffers" }
    }
}
