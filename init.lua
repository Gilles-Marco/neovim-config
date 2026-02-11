-- Plugins options
require("config.lazy")
require("config.lsp_options")

vim.g.lazyvim_check_order = false

-- Autosave on focus lost
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    pattern = "*",
    command = "silent! wa",
})

-- Editor options
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.server_capabilities_inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
    end,
})

vim.opt.termguicolors = true
require('bufferline').setup {}
