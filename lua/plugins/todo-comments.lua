return {
  "folke/todo-comments.nvim",
  event = "BufReadPre",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>lt", "<cmd>Trouble todo<cr>", desc = "[L]ist [T]odos trouble"},
  }
}

