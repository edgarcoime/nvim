return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
