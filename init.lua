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

