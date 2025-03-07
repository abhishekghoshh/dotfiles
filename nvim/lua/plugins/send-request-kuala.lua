return {
  "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>SR", desc = "Send request" },
      { "<leader>SAR", desc = "Send all requests" },
      { "<leader>OSR", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      -- your configuration comes here
      global_keymaps = false,
    },
}
