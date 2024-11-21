return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup({
  --       compile = true,
  --       -- :KanagawaCompile
  --       theme = "wave",
  --     })
  --     vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {},
        transparent_background = true,
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
