return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- minimal config to stop the crash
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
  },
}
